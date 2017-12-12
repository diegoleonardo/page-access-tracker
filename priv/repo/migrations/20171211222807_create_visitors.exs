defmodule PageAccessTracker.Repo.Migrations.CreateVisitors do
  use Ecto.Migration

  def change do
    create table(:visitors) do
      add :identifier, :string

      timestamps()
    end

  end
end
