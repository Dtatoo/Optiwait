defmodule Optiwait.ClinicControllerTest do
  use Optiwait.ConnCase
  import Phoenix.View, only: [render_one: 4, render_many: 4]

  alias Optiwait.Clinic
  @valid_login %{email: "myemail@email.com", password: "mypassword"}
  @valid_location %{
    place_id: "place_id string",
    address: "address string",
    city: "city string",
    province: "province string",
    country: "country string"}
  @valid_hour %{
    weekday: 2,
    start_hour: "12:00:00",
    end_hour: "20:00:00",
    closed: false}
  @valid_hour_2 %{
    weekday: 1,
    start_hour: "2:00:00",
    end_hour: "20:00:00",
    closed: false}

  @valid_attrs %{about: "some content", name: "some content", location: @valid_location, hours: [@valid_hour, @valid_hour_2]}
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
    token =
      conn
      |> post("/api/v1/users", user: @valid_login)
      |> post("/api/v1/login", @valid_login)
      |> get_resp_header("authorization")
      |> List.first
    {:ok, conn: put_req_header(conn, "authorization", token)}
  end

  test "lists all entries on index", %{conn: conn} do
    logged_in_conn =
      conn
      |> get("/api/v1/clinics")
    assert json_response(logged_in_conn, 200)["data"] == []
  end

#  test "shows chosen resource", %{conn: conn} do
#    clinic = Repo.insert! %Clinic{}
#    conn = get conn, clinic_path(conn, :show, clinic)
#    assert json_response(conn, 200)["data"] == %{"id" => clinic.id,
#      "name" => clinic.name,
#      "about" => clinic.about,
#      "user_id" => clinic.user_id,
#      "location" => render_one(clinic.location, Optiwait.LocationView, "location.json", %{}),
#      "hours" => render_many(clinic.hours, Optiwait.HourView, "hour.json", %{})}
#  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, clinic_path(conn, :show, -1)
    end
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, clinic_path(conn, :create), clinic: @valid_attrs
    assert json_response(conn, 201)["data"]["id"] == Repo.get_by(Clinic, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, clinic_path(conn, :create), clinic: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    clinic = Repo.insert! %Clinic{}
    conn = put conn, clinic_path(conn, :update, clinic), clinic: @valid_attrs
    assert json_response(conn, 200)
    # ["data"]["id"]
    #assert Repo.get_by(Clinic, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    clinic = Repo.insert! %Clinic{}
    conn = put conn, clinic_path(conn, :update, clinic), clinic: @invalid_attrs
    IO.puts(conn)
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    clinic = Repo.insert! %Clinic{}
    conn = delete conn, clinic_path(conn, :delete, clinic)
    assert response(conn, 204)
    refute Repo.get(Clinic, clinic.id)
  end
end
