defmodule Optiwait.WaitTime do
  use Optiwait.Web, :model

  schema "wait_times" do
    field :waiting_time, :integer
    belongs_to :clinic, Optiwait.Clinic

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:waiting_time])
    |> cast_assoc(:clinic)
    |> validate_required([:waiting_time])
  end
end
