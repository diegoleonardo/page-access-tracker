defmodule PageAccessTracker.Repo.Migrations.CreateContacts do
  use Ecto.Migration

  def change do
    create table(:contacts) do
      add :firstname, :string
      add :lastname, :string
      add :email, :string
      add :phone, :string
      add :visitor_id, references(:visitors, on_delete: :nothing)

      timestamps()
    end

    create index(:contacts, [:visitor_id])
  end
end
