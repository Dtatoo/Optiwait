defmodule Optiwait.UserTest do
  use Optiwait.ModelCase

  alias Optiwait.User

  # Valid Attributes
  # password length: 5
  # email includes @
  # password needs to be hashed

  @valid_attrs %{email: "myemail@email.com", password: "mypassword", is_admin: true}
  @invalid_password %{email: "myemail@email.com", password: "shor", is_admin: true}
  @invalid_email %{email: "myemailemail.com", password: "passwordtest", is_admin: true}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = User.changeset(%User{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid password" do
    changeset = User.changeset(%User{}, @invalid_password)
    refute changeset.valid?
  end

  test "changeset with invalid email" do
    changeset = User.changeset(%User{}, @invalid_email)
    refute changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = User.changeset(%User{}, @invalid_attrs)
    refute changeset.valid?
  end

end
