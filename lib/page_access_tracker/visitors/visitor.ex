defmodule PageAccessTracker.Visitors.Visitor do
  use Ecto.Schema
  import Ecto.Changeset
  alias PageAccessTracker.Visitors.Visitor

  schema "visitors" do
    field :identifier, :string
    has_many :accessed_pages, PageAccessTracker.AccessedPages.AccessedPage
    has_many :contacts, PageAccessTracker.Contacts.Contact
    timestamps()
  end

  @doc false
  def changeset(%Visitor{} = visitor, attrs) do
    visitor
    |> cast(attrs, [:identifier])
    |> validate_required([:identifier])
  end
end
