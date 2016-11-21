defmodule Optiwait.Location do
  use Optiwait.Web, :model

  schema "locations" do
    field :place_id, :string
    field :address, :string
    field :city, :string
    field :province, :string
    field :country, :string
    belongs_to :clinic, Optiwait.Clinic

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:place_id, :address, :city, :province, :country])
    |> cast_assoc(:clinic)
    |> validate_required([:address, :city, :province, :country])
  end
end
