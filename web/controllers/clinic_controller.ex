defmodule Optiwait.ClinicController do
  use Optiwait.Web, :controller

  alias Optiwait.Clinic

  def index(conn, _params) do
    current_user_clinics =
      Guardian.Plug.current_resource(conn)
      |> assoc(:clinics)

    clinics =
      Repo.all(current_user_clinics)
      |> Repo.preload(:location)
      |> Repo.preload(:hours)
    render(conn, "index.json", clinics: clinics)
  end

  def create(conn, params) do
    current_user = Guardian.Plug.current_resource conn
    changeset =
      current_user
      |> build_assoc(:clinics)
      |> Clinic.changeset(params)

    case Repo.insert(changeset) do
      {:ok, clinic} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", clinic_path(conn, :show, clinic))
        |> render("show.json", clinic: clinic)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Optiwait.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    clinic =
      Repo.get!(Clinic, id)
      |> Repo.preload(:location)
      |> Repo.preload(:hours)
    render(conn, "show.json", clinic: clinic)
  end

  def update(conn, params) do
    %{"id" => id} = params

    clinic =
      Repo.get!(Clinic, id)
      |> Repo.preload(:hours)
      |> Repo.preload(:location)

    changeset =
      Clinic.changeset(clinic, params)

    case Repo.update(changeset) do
      {:ok, clinic} ->
        render(conn, "show.json", clinic: clinic)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Optiwait.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    clinic = Repo.get!(Clinic, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(clinic)

    send_resp(conn, :no_content, "")
  end
end
