defmodule Optiwait.Repo.Migrations.CreateHour do
  use Ecto.Migration

  def change do
    create table(:hours) do
      add :weekday, :integer
      add :start_hour, :time
      add :end_hour, :time
      add :closed, :boolean, default: false, null: false
      add :clinic_id, references(:clinics, on_delete: :nothing)

      timestamps()
    end
    create index(:hours, [:clinic_id])

  end
end
