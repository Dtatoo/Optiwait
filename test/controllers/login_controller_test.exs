defmodule Optiwait.LoginControllerTest do
  use Optiwait.ConnCase

  @valid_attrs %{email: "myemail@email.com", password: "mypassword"}
  @valid_login %{email: "myemail@email.com", password: "mypassword"}
  @invalid_login %{email: "invalid@email.com", password: "mypassword"}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "authentication success", %{conn: conn} do
    conn = post conn, user_path(conn, :create), user: @valid_attrs
    login_conn = post conn, login_path(conn, :login), @valid_login
    assert json_response(login_conn, 200)
  end

  test "authentication fail", %{conn: conn} do
    conn = post conn, user_path(conn, :create), user: @valid_attrs
    login_conn = post conn, login_path(conn, :login), @invalid_login
    assert json_response(login_conn, 401)
  end
end
