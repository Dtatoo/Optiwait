defmodule Optiwait.LoginView do
  use Optiwait.Web, :view

  def render("login.json", %{jwt: jwt}) do
    %{jwt: jwt}
  end
end
