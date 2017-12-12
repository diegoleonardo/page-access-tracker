defmodule PageAccessTrackerWeb.ContactControllerTest do
  use PageAccessTrackerWeb.ConnCase
  alias PageAccessTracker.Visitors

  @valid_visitor_attrs %{identifier: Ecto.UUID.generate}
  @create_attrs %{visitor_id: 0, email: "some email", firstname: "some firstname", lastname: "some lastname", phone: "some phone"}
  @invalid_attrs %{email: nil, firstname: nil, lastname: nil, phone: nil}

  def fixture(:contact) do
    {:ok, visitor} = Visitors.create_visitor(@valid_visitor_attrs)
    valid_attrs = %{ @create_attrs | visitor_id: visitor.id}
    {:ok, contact} = Contacts.create_contact(valid_attrs)
    contact
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "create contact" do
    test "renders contact when data is valid", %{conn: conn} do
      {:ok, visitor} = Visitors.create_visitor(@valid_visitor_attrs)
      valid_attrs = %{ @create_attrs | visitor_id: visitor.id}

      conn = post conn, contact_path(conn, :create), contact: valid_attrs
      assert json_response(conn, 201)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, contact_path(conn, :create), contact: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end
end
