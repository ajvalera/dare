defmodule Dare.Repo.Migrations.CreateUser do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :name, :string
      add :email, :string
      add :password, :string, virtual: true
      add :crypted_password, :string

      timestamps
    end
    create unique_index(:users, [:email])

  end
end