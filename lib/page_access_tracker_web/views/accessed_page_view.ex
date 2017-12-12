defmodule PageAccessTrackerWeb.AccessedPageView do
  use PageAccessTrackerWeb, :view
  alias PageAccessTrackerWeb.AccessedPageView

  def render("index.json", %{accessed_pages: accessed_pages}) do
    %{data: render_many(accessed_pages, AccessedPageView, "accessed_page.json")}
  end

  def render("show.json", %{accessed_page: accessed_page}) do
    %{data: render_one(accessed_page, AccessedPageView, "accessed_page.json")}
  end

  def render("accessed_page.json", %{accessed_page: accessed_page}) do
    %{id: accessed_page.id,
      accessed_url: accessed_page.accessed_url,
      access_date: accessed_page.access_date}
  end
end
