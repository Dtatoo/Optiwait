defmodule Optiwait.ClinicControllerTest do
  use Optiwait.ConnCase, async: false

  alias Optiwait.Clinic
  @valid_attrs %{about: "some content", name: "some content"}
  @valid_login %{email: "myemail@email.com", password: "mypassword"}
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "lists all entries on index", %{conn: conn} do
    conn =
      conn
      |> post("/api/v1/users", user: @valid_login)
      |> post("/api/v1/login", @valid_login)
      |> recycle
      IO.puts conn
      #|> get("api/v1/clinics")

    assert json_response(conn, 200)["data"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    clinic = Repo.insert! %Clinic{}
    conn = get conn, clinic_path(conn, :show, clinic)
    assert json_response(conn, 200)["data"] == %{"id" => clinic.id,
      "name" => clinic.name,
      "about" => clinic.about,
      "user_id" => clinic.user_id}
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, clinic_path(conn, :show, -1)
    end
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, clinic_path(conn, :create), clinic: @valid_attrs
    assert json_response(conn, 201)["data"]["id"]
    assert Repo.get_by(Clinic, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, clinic_path(conn, :create), clinic: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    clinic = Repo.insert! %Clinic{}
    conn = put conn, clinic_path(conn, :update, clinic), clinic: @valid_attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(Clinic, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    clinic = Repo.insert! %Clinic{}
    conn = put conn, clinic_path(conn, :update, clinic), clinic: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    clinic = Repo.insert! %Clinic{}
    conn = delete conn, clinic_path(conn, :delete, clinic)
    assert response(conn, 204)
    refute Repo.get(Clinic, clinic.id)
  end
end
