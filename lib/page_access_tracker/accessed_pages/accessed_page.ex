defmodule PageAccessTracker.AccessedPages.AccessedPage do
  use Ecto.Schema
  import Ecto.Changeset
  alias PageAccessTracker.AccessedPages.AccessedPage


  schema "accessed_pages" do
    field :access_date, :utc_datetime
    field :accessed_url, :string
    belongs_to :visitor, PageAccessTracker.Visitors.Visitor
    timestamps()
  end

  @doc false
  def changeset(%AccessedPage{} = accessed_page, attrs) do
    accessed_page
    |> cast(attrs, [:visitor_id, :accessed_url, :access_date])
    |> validate_format(:accessed_url, ~r/(https?:\/\/(?:www\.|(?!www))[a-zA-Z0-9][a-zA-Z0-9-]+[a-zA-Z0-9]\.[^\s]{2,}|www\.[a-zA-Z0-9][a-zA-Z0-9-]+[a-zA-Z0-9]\.[^\s]{2,}|https?:\/\/(?:www\.|(?!www))[a-zA-Z0-9]\.[^\s]{2,}|www\.[a-zA-Z0-9]\.[^\s]{2,})/)
    |> validate_required([:visitor_id, :accessed_url, :access_date])
  end
end
