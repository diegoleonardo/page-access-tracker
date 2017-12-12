defmodule PageAccessTrackerWeb.ContactViewerControllerTest do
  use PageAccessTrackerWeb.ConnCase

  describe "index" do
    test "lists all contact_viewer", %{conn: conn} do
      conn = get conn, contact_viewer_path(conn, :index)
      assert html_response(conn, 200) =~ "Listing Contacts"
    end
  end
end
