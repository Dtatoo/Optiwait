defmodule Optiwait.HourTest do
  use Optiwait.ModelCase

  alias Optiwait.Hour

  @valid_attrs %{closed: true, end_hour: %{hour: 14, min: 0, sec: 0}, start_hour: %{hour: 14, min: 0, sec: 0}, weekday: 42}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Hour.changeset(%Hour{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Hour.changeset(%Hour{}, @invalid_attrs)
    refute changeset.valid?
  end
end
