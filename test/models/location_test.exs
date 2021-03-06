defmodule Optiwait.LocationTest do
  use Optiwait.ModelCase

  alias Optiwait.Location

  @valid_attrs %{address: "some content", city: "some content", country: "some content", place_id: "some content", province: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Location.changeset(%Location{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Location.changeset(%Location{}, @invalid_attrs)
    refute changeset.valid?
  end
end
