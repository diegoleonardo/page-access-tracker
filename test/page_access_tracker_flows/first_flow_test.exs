defmodule PageAccessTracker.FirstFlowTest do
    use PageAccessTrackerWeb.ConnCase, async: false

    alias PageAccessTracker.Visitors
    alias PageAccessTracker.AccessedPages
    alias PageAccessTracker.Contacts

    alias PageAccessTracker.Visitors.Visitor
    alias PageAccessTracker.AccessedPages.AccessedPage
    alias PageAccessTracker.Contacts.Contact

    @valid_visitor_attrs %{identifier: Ecto.UUID.generate}
    @valid_visitor %{visitor_id: 0, access_date: DateTime.utc_now, accessed_url: "" }
    @valid_contact_attrs %{visitor_id: 0, email: "john_doe@contact.com", firstname: "John", lastname: "Doe", phone: "48996381240"}

    setup %{conn: conn} do
        {:ok, conn: put_req_header(conn, "accept", "application/json")}
    end
    
    setup_all context do
        :ok
    end 

    describe "Flow visitor A" do
        setup [:create_visitor_a]

        test "Visitor A, access the page home", %{conn: conn, visitor_a: visitor_a} do
            valid_attrs = %{ @valid_visitor | visitor_id: visitor_a.id, accessed_url: "www.example.com/home"}
            
            assert {:ok, %AccessedPage{} = accessed_page} = AccessedPages.create_accessed_page(valid_attrs)
            assert accessed_page.accessed_url == "www.example.com/home"
            assert accessed_page.visitor_id == visitor_a.id
        end

        test "Visitor A access the page price", %{conn: conn, visitor_a: visitor_a} do
            valid_attrs = %{ @valid_visitor | visitor_id: visitor_a.id, accessed_url: "www.example.com/price"}
            
            assert {:ok, %AccessedPage{} = accessed_page} = AccessedPages.create_accessed_page(valid_attrs)
            assert accessed_page.accessed_url == "www.example.com/price"
            assert accessed_page.visitor_id == visitor_a.id
        end

        test "Visitor A access the page contact", %{conn: conn, visitor_a: visitor_a} do
        
        end
        
        test "visitor A become a contact"
        # PAGES TO SHOW -> Home, Price, Contact
        test "when visiting area of visitor A show the accessed pages"
    end

    describe "Flow Visitor B" do
        setup [:create_visitor_b]
        setup [:create_contact_b]

        test "Visitor B acces the page home", %{visitor_b: visitor_b} do
            valid_attrs = %{ @valid_visitor | visitor_id: visitor_b.id, accessed_url: "www.example.com/home"}
            
            assert {:ok, %AccessedPage{} = accessed_page} = AccessedPages.create_accessed_page(valid_attrs)
            assert accessed_page.accessed_url == "www.example.com/home"
            assert accessed_page.visitor_id == visitor_b.id
        end

        test "Visitor B access the page contact", %{visitor_b: visitor_b} do
            valid_attrs = %{ @valid_visitor | visitor_id: visitor_b.id, accessed_url: "www.example.com/contact"}
            
            assert {:ok, %AccessedPage{} = accessed_page} = AccessedPages.create_accessed_page(valid_attrs)
            assert accessed_page.accessed_url == "www.example.com/contact"
            assert accessed_page.visitor_id == visitor_b.id
        end

        test "Visitor B become a contact", %{contact_b: contact_b} do
            
            assert contact_b.id != nil
        end

        # PAGES TO SHOW -> Home, Contact
        test "When visiting area of visitor B show the accessed pages", %{contact_b: contact_b} do
            contact_b_id = contact_b.id

            pages = AccessedPages.list_pages_accesseds(contact_b_id)

            assert Enum.count(pages.accessed_url) > 0
        end
        test "Visitor B access the page about"
        # PAGES_TO_SHOW -> Home, Contact, About
        test "when visiting area of visitor B show the accessed pages"
    end

    defp create_visitor_a(_) do
        {:ok, visitor_a} = Visitors.create_visitor(@valid_visitor_attrs)
        {:ok, visitor_a: visitor_a}    
    end

    defp create_visitor_b(_) do
        {:ok, visitor_b} = Visitors.create_visitor(@valid_visitor_attrs)
        {:ok, visitor_b: visitor_b}
    end

    defp create_contact_a(context) do
        valid_contact = %{ @valid_contact_attrs | visitor_id: context[:visitor_a].id}
        {:ok, contact_a} = Contacts.create_contact(valid_contact)
        {:ok, contact_a: contact_a}
    end

    defp create_contact_b(context) do
        valid_contact = %{@valid_contact_attrs | visitor_id: context[:visitor_b].id}
        {:ok, contact_b} = Contacts.create_contact(valid_contact)
        {:ok, contact_b: contact_b}
    end
end