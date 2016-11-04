defmodule Optiwait.WaitTimeControllerTest do
  use Optiwait.ConnCase

  alias Optiwait.WaitTime
  @valid_attrs %{waiting_time: 42}
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, wait_time_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    wait_time = Repo.insert! %WaitTime{}
    conn = get conn, wait_time_path(conn, :show, wait_time)
    assert json_response(conn, 200)["data"] == %{"id" => wait_time.id,
      "waiting_time" => wait_time.waiting_time,
      "clinic_id" => wait_time.clinic_id}
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, wait_time_path(conn, :show, -1)
    end
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, wait_time_path(conn, :create), wait_time: @valid_attrs
    assert json_response(conn, 201)["data"]["id"]
    assert Repo.get_by(WaitTime, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, wait_time_path(conn, :create), wait_time: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    wait_time = Repo.insert! %WaitTime{}
    conn = put conn, wait_time_path(conn, :update, wait_time), wait_time: @valid_attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(WaitTime, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    wait_time = Repo.insert! %WaitTime{}
    conn = put conn, wait_time_path(conn, :update, wait_time), wait_time: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    wait_time = Repo.insert! %WaitTime{}
    conn = delete conn, wait_time_path(conn, :delete, wait_time)
    assert response(conn, 204)
    refute Repo.get(WaitTime, wait_time.id)
  end
end
