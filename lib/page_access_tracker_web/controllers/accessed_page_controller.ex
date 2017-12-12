defmodule PageAccessTrackerWeb.AccessedPageController do
  use PageAccessTrackerWeb, :controller

  alias PageAccessTracker.AccessedPages
  alias PageAccessTracker.AccessedPages.AccessedPage

  action_fallback PageAccessTrackerWeb.FallbackController

  def create(conn, %{"accessed_page" => accessed_page_params}) do
    with {:ok, %AccessedPage{} = accessed_page} <- AccessedPages.create_accessed_page(accessed_page_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", accessed_page_path(conn, :show, accessed_page))
      |> render("show.json", accessed_page: accessed_page)
    end
  end
end
