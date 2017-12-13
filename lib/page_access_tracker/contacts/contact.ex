defmodule PageAccessTracker.Contacts.Contact do
  use Ecto.Schema
  import Ecto.Changeset
  alias PageAccessTracker.Contacts.Contact


  schema "contacts" do
    field :email, :string
    field :firstname, :string
    field :lastname, :string
    field :phone, :string
    belongs_to :visitor, PageAccessTracker.Visitors.Visitor
    timestamps()
  end

  @doc false
  def changeset(%Contact{} = contact, attrs) do
    contact
    |> cast(attrs, [:visitor_id, :firstname, :lastname, :email, :phone])
    |> validate_required([:visitor_id, :email])
  end
end
