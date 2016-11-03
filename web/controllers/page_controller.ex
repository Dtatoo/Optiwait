defmodule Optiwait.PageController do
  use Optiwait.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
