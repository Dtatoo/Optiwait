defmodule Optiwait.Clinic do
  use Optiwait.Web, :model

  alias Optiwait.Hour
  alias Optiwait.Location

  schema "clinics" do
    field :name, :string
    field :about, :string
    has_many :hours, Optiwait.Hour
    has_one :location, Optiwait.Location
    belongs_to :user, Optiwait.User

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :about])
    |> validate_required([:name])
    |> add_hours_and_location(params)
  end

  @doc """
    Validate hours
    Return [hour] changeset
  """
  def validate_hours(hours) do
    Enum.map hours, fn(item) -> Hour.changeset(%Hour{}, item) end
  end

  def validate_location(location) do
    Location.changeset(%Location{}, location)
  end

  def add_hours_and_location(changeset, params) do
    %{ "hours" => hour_params,
    "location" => location_params
    } = params

    hours = validate_hours hour_params
    location = validate_location location_params

    changeset
    |> put_assoc(:hours, hours)
    |> put_assoc(:location, location)
  end

end
