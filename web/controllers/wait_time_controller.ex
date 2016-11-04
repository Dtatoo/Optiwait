defmodule Optiwait.WaitTimeController do
  use Optiwait.Web, :controller

  alias Optiwait.WaitTime

  def index(conn, _params) do
    wait_times = Repo.all(WaitTime)
    render(conn, "index.json", wait_times: wait_times)
  end

  def create(conn, %{"wait_time" => wait_time_params}) do
    changeset = WaitTime.changeset(%WaitTime{}, wait_time_params)

    case Repo.insert(changeset) do
      {:ok, wait_time} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", wait_time_path(conn, :show, wait_time))
        |> render("show.json", wait_time: wait_time)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Optiwait.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    wait_time = Repo.get!(WaitTime, id)
    render(conn, "show.json", wait_time: wait_time)
  end

  def update(conn, %{"id" => id, "wait_time" => wait_time_params}) do
    wait_time = Repo.get!(WaitTime, id)
    changeset = WaitTime.changeset(wait_time, wait_time_params)

    case Repo.update(changeset) do
      {:ok, wait_time} ->
        render(conn, "show.json", wait_time: wait_time)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Optiwait.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    wait_time = Repo.get!(WaitTime, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(wait_time)

    send_resp(conn, :no_content, "")
  end
end
