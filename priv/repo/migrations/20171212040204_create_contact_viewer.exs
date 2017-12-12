defmodule PageAccessTracker.Repo.Migrations.CreateContactViewer do
  use Ecto.Migration

  def change do
    create table(:contact_viewer) do
      add :title, :string

      timestamps()
    end

  end
end
