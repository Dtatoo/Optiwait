defmodule Optiwait.UserView do
  use Optiwait.Web, :view

  def render("index.json", %{users: users}) do
    %{data: render_many(users, Optiwait.UserView, "user.json")}
  end

  def render("show.json", %{user: user}) do
    %{data: render_one(user, Optiwait.UserView, "user.json")}
  end

  def render("user.json", %{user: user}) do
    %{id: user.id,
      email: user.email,
      hashed_password: user.hashed_password,
      is_admin: user.is_admin}
  end
end
