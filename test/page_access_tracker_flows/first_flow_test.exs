defmodule PageAccessTracker.FirstFlowTest do
    use PageAccessTracker.DataCase

    alias PageAccessTracker.Visitors
    alias PageAccessTracker.AccessedPages
    alias PageAccessTracker.Contacts

    describe "First flow" do
        alias PageAccessTracker.Visitors.Visitor
        alias PageAccessTracker.AccessedPages.AccessedPage
        alias PageAccessTracker.Contacts.Contact
        
        page_home = "www.example.com/home" 
        page_price = "www.example.com/price"
        page_contact = "www.example.com/contact"
        page_about = "www.example.com/about"

        @valid_visitor_attrs %{identifier: Ecto.UUID.generate}
        @valid_visitor_home %{visitor_id: 0, access_date: DateTime.utc_now, accessed_url: "www.example.com/home" }
        @valid_visitor_price %{visitor_id: 0, access_date: DateTime.utc_now, accessed_url: page_price}
        @valid_visitor_contact %{visitor_id: 0, access_date: DateTime.utc_now, accessed_url: page_contact}
        @valid_visitor_about %{visitor_id: 0, access_date: DateTime.utc_now, accessed_url: page_about}
        @valid_contact_attrs %{visitor_id: 0, email: "john_doe@contact.com", firstname: "John", lastname: "Doe", phone: "48996381240"}

        test "Visitor A, access the page home" do
            {:ok, visitor} = Visitors.create_visitor(@valid_visitor_attrs)
            valid_attrs = %{ @valid_visitor_home | visitor_id: visitor.id}
            assert {:ok, %AccessedPage{} = accessed_page} = AccessedPages.create_accessed_page(valid_attrs)

            assert accessed_page.accessed_url == "www.example.com/home"
        end
        test "Visito A access the page price"
        test "Visitor B acces the page home"
        test "Visitor B access the page contact"
        test "Visitor B become a contact"
        # PAGES TO SHOW -> Home, Contact
        test "When visiting area of visitor B show the accessed pages"
        test "Visitor A access the page contact"
        test "visitor A become a contact"
        # PAGES TO SHOW -> Home, Price, Contact
        test "when visiting area of visitor A show the accessed pages"
        test "Visitor B access the page about"
        # PAGES_TO_SHOW -> Home, Contact, About
        test "when visiting area of visitor B show the accessed pages"
    end

end