defmodule Optiwait.Repo.Migrations.CreateUser do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :email, :string
      add :hashed_password, :string
      add :is_admin, :boolean, default: false, null: false

      timestamps()
    end
    create unique_index(:users, [:email])

  end
end
