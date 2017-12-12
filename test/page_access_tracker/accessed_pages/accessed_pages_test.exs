defmodule PageAccessTracker.AccessedPagesTest do
  use PageAccessTracker.DataCase

  alias PageAccessTracker.AccessedPages
  alias PageAccessTracker.Visitors

  describe "accessed_pages" do
    alias PageAccessTracker.AccessedPages.AccessedPage

    @valid_visitor_attrs %{identifier: Ecto.UUID.generate}

    @valid_attrs %{visitor_id: 0, access_date: "2017-01-23T23:50:07.000000Z", accessed_url: "www.examplo.com"}
    @invalid_attrs %{access_date: nil, accessed_url: nil}

    def accessed_page_fixture(attrs \\ %{}) do
      {:ok, visitor} = Visitors.create_visitor(@valid_visitor_attrs)
      valid_attrs = %{ @valid_attrs | visitor_id: visitor.id}
      {:ok, accessed_page} =
        attrs
        |> Enum.into(valid_attrs)
        |> AccessedPages.create_accessed_page()

      accessed_page
    end

    test "list_accessed_pages/0 returns all accessed_pages" do
      accessed_page = accessed_page_fixture()
      assert AccessedPages.list_accessed_pages() == [accessed_page]
    end

    test "get_accessed_page!/1 returns the accessed_page with given id" do
      accessed_page = accessed_page_fixture()
      assert AccessedPages.get_accessed_page!(accessed_page.id) == accessed_page
    end

    test "create_accessed_page/1 with valid data creates a accessed_page" do
      {:ok, visitor} = Visitors.create_visitor(@valid_visitor_attrs)
      valid_attrs = %{ @valid_attrs | visitor_id: visitor.id}
      assert {:ok, %AccessedPage{} = accessed_page} = AccessedPages.create_accessed_page(valid_attrs)
      {:ok, datetime, 0} = DateTime.from_iso8601("2017-01-23T23:50:07.000000Z")
      assert accessed_page.access_date == datetime
      assert accessed_page.accessed_url == "www.examplo.com"
    end

    test "create_accessed_page/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = AccessedPages.create_accessed_page(@invalid_attrs)
    end

    def compare_dates?(main_datetime, datetime_to_compare) do
        main_datetime.year == datetime_to_compare.year
    end

  end
end
