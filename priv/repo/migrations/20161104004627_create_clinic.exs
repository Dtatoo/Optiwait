defmodule Optiwait.Repo.Migrations.CreateClinic do
  use Ecto.Migration

  def change do
    create table(:clinics) do
      add :name, :string
      add :about, :string
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end
    create index(:clinics, [:user_id])

  end
end
