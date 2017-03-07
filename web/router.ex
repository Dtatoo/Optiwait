defmodule Optiwait.Router do
  use Optiwait.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :api_authenticated do
    plug Guardian.Plug.VerifyHeader, realm: "Bearer"
    plug Guardian.Plug.LoadResource
    plug Guardian.Plug.EnsureAuthenticated
  end


  scope "/", Optiwait do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index

  end

  forward "/g", Absinthe.Plug, schema: Optiwait.Schema
  forward "/graphiql", Absinthe.Plug.GraphiQL, schema: Optiwait.Schema

  scope "/api/v1", Optiwait do
    pipe_through [:api]
    resources "/users", UserController, except: [:new, :edit]
    post "/login", LoginController, :login

    pipe_through [:api_authenticated]
    resources "/clinics", ClinicController, except: [:new, :edit]
    resources "/hours", HourController, except: [:new, :edit]
    resources "/wait_times", WaitTimeController, except: [:new, :edit]
    resources "/locations", LocationController, except: [:new, :edit]
  end

end
