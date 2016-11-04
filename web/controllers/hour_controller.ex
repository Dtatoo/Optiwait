defmodule Optiwait.HourController do
  use Optiwait.Web, :controller

  alias Optiwait.Hour

  def index(conn, _params) do
    hours = Repo.all(Hour)
    render(conn, "index.json", hours: hours)
  end

  def create(conn, %{"hour" => hour_params}) do
    changeset = Hour.changeset(%Hour{}, hour_params)

    case Repo.insert(changeset) do
      {:ok, hour} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", hour_path(conn, :show, hour))
        |> render("show.json", hour: hour)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Optiwait.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    hour = Repo.get!(Hour, id)
    render(conn, "show.json", hour: hour)
  end

  def update(conn, %{"id" => id, "hour" => hour_params}) do
    hour = Repo.get!(Hour, id)
    changeset = Hour.changeset(hour, hour_params)

    case Repo.update(changeset) do
      {:ok, hour} ->
        render(conn, "show.json", hour: hour)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Optiwait.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    hour = Repo.get!(Hour, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(hour)

    send_resp(conn, :no_content, "")
  end
end
