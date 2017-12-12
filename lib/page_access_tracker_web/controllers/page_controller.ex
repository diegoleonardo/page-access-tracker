defmodule PageAccessTrackerWeb.PageController do
  use PageAccessTrackerWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
