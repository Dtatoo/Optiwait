defmodule Optiwait.HourControllerTest do
  use Optiwait.ConnCase

  alias Optiwait.Hour
  @valid_attrs %{closed: true, end_hour: %{hour: 14, min: 0, sec: 0}, start_hour: %{hour: 14, min: 0, sec: 0}, weekday: 42}
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, hour_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    hour = Repo.insert! %Hour{}
    conn = get conn, hour_path(conn, :show, hour)
    assert json_response(conn, 200)["data"] == %{"id" => hour.id,
      "weekday" => hour.weekday,
      "start_hour" => hour.start_hour,
      "end_hour" => hour.end_hour,
      "closed" => hour.closed,
      "clinic_id" => hour.clinic_id}
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, hour_path(conn, :show, -1)
    end
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, hour_path(conn, :create), hour: @valid_attrs
    assert json_response(conn, 201)["data"]["id"]
    assert Repo.get_by(Hour, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, hour_path(conn, :create), hour: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    hour = Repo.insert! %Hour{}
    conn = put conn, hour_path(conn, :update, hour), hour: @valid_attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(Hour, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    hour = Repo.insert! %Hour{}
    conn = put conn, hour_path(conn, :update, hour), hour: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    hour = Repo.insert! %Hour{}
    conn = delete conn, hour_path(conn, :delete, hour)
    assert response(conn, 204)
    refute Repo.get(Hour, hour.id)
  end
end
