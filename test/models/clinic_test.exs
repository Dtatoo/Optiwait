defmodule Optiwait.ClinicTest do
  use Optiwait.ModelCase

  alias Optiwait.Clinic

  @valid_attrs %{about: "some content", name: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Clinic.changeset(%Clinic{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Clinic.changeset(%Clinic{}, @invalid_attrs)
    refute changeset.valid?
  end
end
