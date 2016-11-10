defmodule Optiwait.Repo.Migrations.CreateWaitTime do
  use Ecto.Migration

  def change do
    create table(:wait_times) do
      add :waiting_time, :integer
      add :clinic_id, references(:clinics, on_delete: :nothing)

      timestamps()
    end
    create index(:wait_times, [:clinic_id])

  end
end
