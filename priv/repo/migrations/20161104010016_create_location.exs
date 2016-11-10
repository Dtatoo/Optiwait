defmodule Optiwait.Repo.Migrations.CreateLocation do
  use Ecto.Migration

  def change do
    create table(:locations) do
      add :place_id, :string
      add :address, :string
      add :city, :string
      add :province, :string
      add :country, :string
      add :clinic_id, references(:clinics, on_delete: :nothing)

      timestamps()
    end
    create index(:locations, [:clinic_id])

  end
end
