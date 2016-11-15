defmodule Optiwait.ClinicController do
  use Optiwait.Web, :controller

  alias Ecto.Multi
  alias Optiwait.Clinic
  alias Optiwait.Hour

  def combine_changeset(accumulator, []) do
    accumulator
  end
  def combine_changeset(accumulator, [head | tail]) do
    Multi.insert(accumulator, Enum.take_random(?a..?z, 5), Hour.changeset(%Hour{}, head))
    |> combine_changeset(tail)
  end

  def index(conn, _params) do
    current_user_clinic =
      Guardian.Plug.current_resource(conn)
      |> assoc(:clinics)

    clinics = Repo.all(current_user_clinic)
    render(conn, "index.json", clinics: clinics)
  end

  def create(conn, %{"clinic" => clinic_params, "hour" => hour_params}) do
    current_user = Guardian.Plug.current_resource conn

    changeset =
      current_user
      |> build_assoc(:clinics)
      |> Clinic.changeset(clinic_params)

    Repo.transaction(combine_changeset(Multi.new(), hour_params))

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
    clinic = Repo.get!(Clinic, id)
    render(conn, "show.json", clinic: clinic)
  end

  def update(conn, %{"id" => id, "clinic" => clinic_params}) do
    clinic =
      Repo.get!(Clinic, id)
      |> Repo.preload(:user)
    changeset = Clinic.changeset(clinic, clinic_params)

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
