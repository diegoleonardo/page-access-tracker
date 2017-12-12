defmodule PageAccessTrackerWeb.AccessedPageControllerTest do
  use PageAccessTrackerWeb.ConnCase

  alias PageAccessTracker.Visitors

  @create_visitor_attrs %{identifier: Ecto.UUID.generate}
  @create_attrs %{access_date: "2017-01-23T23:50:07.000000Z", accessed_url: "www.examplo.com"}
  @invalid_attrs %{access_date: nil, accessed_url: nil}

  def fixture(:visitor) do
    {:ok, visitor} = Visitors.create_visitor(@create_visitor_attrs)
    visitor
  end

  def fixture(:accessed_page) do
    {:ok, accessed_page} = AccessedPages.create_accessed_page(@create_attrs)
    accessed_page
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "create accessed_page" do
    setup [:create_visitor]

    test "renders accessed_page when data is valid", %{conn: conn, visitor: visitor} do
      conn = post conn, accessed_page_path(conn, :create), 
        accessed_page: %{visitor_id: visitor.id, access_date: "2017-01-23T23:50:07.000000Z", accessed_url: "www.examplo.com"}
      
      assert json_response(conn, 201)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, accessed_page_path(conn, :create), accessed_page: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  defp create_visitor(_) do
    visitor = fixture(:visitor)
    {:ok, visitor: visitor}
  end
  
end
