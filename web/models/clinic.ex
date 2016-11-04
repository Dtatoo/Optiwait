defmodule Optiwait.Clinic do
  use Optiwait.Web, :model

  schema "clinics" do
    field :name, :string
    field :about, :string
    belongs_to :user, Optiwait.User

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :about])
    |> cast_assoc(:user)
    |> validate_required([:name])
  end
end
