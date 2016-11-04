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

  scope "/", Optiwait do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  scope "/api/v1", Optiwait do
    pipe_through :api

    resources "/users", UserController, except: [:new, :edit]
    resources "/clinics", ClinicController, except: [:new, :edit]
    resources "/hours", HourController, except: [:new, :edit]
    resources "/wait_times", WaitTimeController, except: [:new, :edit]
    resources "/locations", LocationController, except: [:new, :edit]
  end
end
