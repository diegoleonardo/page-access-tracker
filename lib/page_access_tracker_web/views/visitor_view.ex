defmodule PageAccessTrackerWeb.VisitorView do
  use PageAccessTrackerWeb, :view
  alias PageAccessTrackerWeb.VisitorView

  def render("index.json", %{visitors: visitors}) do
    %{data: render_many(visitors, VisitorView, "visitor.json")}
  end

  def render("show.json", %{visitor: visitor}) do
    %{data: render_one(visitor, VisitorView, "visitor.json")}
  end

  def render("visitor.json", %{visitor: visitor}) do
    %{id: visitor.id,
      identifier: visitor.identifier}
  end
end
