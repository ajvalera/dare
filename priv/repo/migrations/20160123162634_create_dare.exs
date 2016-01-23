defmodule Dare.Repo.Migrations.CreateDare do
  use Ecto.Migration

  def change do
    create table(:dares) do
      add :name, :string
      add :description, :string
      add :goal, :integer
      add :raised, :integer
      add :user_id, references(:users)

      timestamps
    end
    create index(:dares, [:user_id])

  end
end
