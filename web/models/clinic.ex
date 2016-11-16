defmodule Optiwait.Clinic do
  use Optiwait.Web, :model

  alias Optiwait.Hour

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
  end

  @doc """
    Validate hours
    Return [hour] changeset
  """
  def validate_hours(hours) do
    Enum.map hours, fn(item) -> Hour.changeset(%Hour{}, item) end
  end

end
