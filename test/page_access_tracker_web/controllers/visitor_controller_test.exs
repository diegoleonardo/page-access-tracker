defmodule PageAccessTrackerWeb.VisitorControllerTest do
  use PageAccessTrackerWeb.ConnCase

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "create visitor" do
    test "renders visitor when data is valid", %{conn: conn} do
      conn = post conn, visitor_path(conn, :create)
      assert json_response(conn, 201)["data"]
    end
  end
end
