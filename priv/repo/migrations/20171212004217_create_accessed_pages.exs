defmodule PageAccessTracker.Repo.Migrations.CreateAccessedPages do
  use Ecto.Migration

  def change do
    create table(:accessed_pages) do
      add :accessed_url, :string
      add :access_date, :utc_datetime
      add :visitor_id, references(:visitors, on_delete: :nothing)

      timestamps()
    end

    create index(:accessed_pages, [:visitor_id])
  end
end
