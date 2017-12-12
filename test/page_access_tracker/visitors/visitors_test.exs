defmodule PageAccessTracker.VisitorsTest do
  use PageAccessTracker.DataCase

  alias PageAccessTracker.Visitors

  describe "visitors" do
    alias PageAccessTracker.Visitors.Visitor

    @valid_attrs %{identifier: "some identifier"}
    @update_attrs %{identifier: "some updated identifier"}
    @invalid_attrs %{identifier: nil}

    def visitor_fixture(attrs \\ %{}) do
      {:ok, visitor} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Visitors.create_visitor()

      visitor
    end

    test "list_visitors/0 returns all visitors" do
      visitor = visitor_fixture()
      assert Visitors.list_visitors() == [visitor]
    end

    test "get_visitor!/1 returns the visitor with given id" do
      visitor = visitor_fixture()
      assert Visitors.get_visitor!(visitor.id) == visitor
    end

    test "create_visitor/1 with valid data creates a visitor" do
      assert {:ok, %Visitor{} = visitor} = Visitors.create_visitor(@valid_attrs)
      assert visitor.identifier == "some identifier"
    end

    test "create_visitor/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Visitors.create_visitor(@invalid_attrs)
    end

    test "update_visitor/2 with valid data updates the visitor" do
      visitor = visitor_fixture()
      assert {:ok, visitor} = Visitors.update_visitor(visitor, @update_attrs)
      assert %Visitor{} = visitor
      assert visitor.identifier == "some updated identifier"
    end

    test "update_visitor/2 with invalid data returns error changeset" do
      visitor = visitor_fixture()
      assert {:error, %Ecto.Changeset{}} = Visitors.update_visitor(visitor, @invalid_attrs)
      assert visitor == Visitors.get_visitor!(visitor.id)
    end

    test "delete_visitor/1 deletes the visitor" do
      visitor = visitor_fixture()
      assert {:ok, %Visitor{}} = Visitors.delete_visitor(visitor)
      assert_raise Ecto.NoResultsError, fn -> Visitors.get_visitor!(visitor.id) end
    end

    test "change_visitor/1 returns a visitor changeset" do
      visitor = visitor_fixture()
      assert %Ecto.Changeset{} = Visitors.change_visitor(visitor)
    end
  end
end
