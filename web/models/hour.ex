defmodule Optiwait.Hour do
  use Optiwait.Web, :model

  schema "hours" do
    field :weekday, :integer
    field :start_hour, Ecto.Time
    field :end_hour, Ecto.Time
    field :closed, :boolean, default: false
    belongs_to :clinic, Optiwait.Clinic

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:weekday, :start_hour, :end_hour, :closed])
    |> validate_number(:weekday, less_than: 7)
    |> validate_required([:weekday, :start_hour, :end_hour, :closed])
  end
end
