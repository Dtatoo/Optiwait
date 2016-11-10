defmodule Optiwait.LoginController do
  use Optiwait.Web, :controller

  alias Optiwait.User

  def login(conn, params) do
    case login_validation(params) do
      {true, user} ->
        new_conn = Guardian.Plug.api_sign_in(conn, user)
        jwt = Guardian.Plug.current_token(new_conn)
        claims = Guardian.Plug.claims(new_conn)
        exp = claims |> elem(1) |> Map.get("exp") |> Integer.to_string

        new_conn
        |> put_resp_header("authorization", "Bearer #{jwt}")
        |> put_resp_header("x-expires", exp)
        |> render("login.json", user: user, jwt: jwt, exp: exp)
      _no_user ->
        conn
        |> put_status(401)
        |> render(Optiwait.ErrorView, "error.json", message: "Invalid Login")
    end
  end

  def email_validation(email) do
    user = Repo.get_by User, email: email
    case user do
      nil ->
        {:error, "No user found"}
      _ ->
        {:ok, user}
    end
  end

  def login_validation(%{"email" => email, "password" => password}) do
    case email_validation email do
      {:ok, user} ->
        {Comeonin.Bcrypt.checkpw(password, user.hashed_password), user}
      _ ->
        Comeonin.Bcrypt.dummy_checkpw()
    end
  end

end
