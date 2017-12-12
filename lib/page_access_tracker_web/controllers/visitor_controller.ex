defmodule PageAccessTrackerWeb.VisitorController do
  use PageAccessTrackerWeb, :controller

  alias PageAccessTracker.Visitors
  alias PageAccessTracker.Visitors.Visitor

  action_fallback PageAccessTrackerWeb.FallbackController
  
  def create(conn, _params) do
    visitor_params = %{identifier: Ecto.UUID.generate()}
    with {:ok, %Visitor{} = visitor} <- Visitors.create_visitor(visitor_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", visitor_path(conn, :show, visitor))
      |> render("show.json", visitor: visitor)
    end
  end

end
