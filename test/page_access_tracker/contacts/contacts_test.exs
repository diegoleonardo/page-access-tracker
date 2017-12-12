defmodule PageAccessTracker.ContactsTest do
  use PageAccessTracker.DataCase

  alias PageAccessTracker.Contacts
  alias PageAccessTracker.Visitors

  describe "contacts" do
    alias PageAccessTracker.Contacts.Contact

    @valid_visitor_attrs %{identifier: Ecto.UUID.generate}
    @valid_attrs %{visitor_id: 0, email: "some email", firstname: "some firstname", lastname: "some lastname", phone: "some phone"}
    @update_attrs %{visitor_id: 0, email: "some updated email", firstname: "some updated firstname", lastname: "some updated lastname", phone: "some updated phone"}
    @invalid_attrs %{email: nil, firstname: nil, lastname: nil, phone: nil}

    def contact_fixture(attrs \\ %{}) do
      {:ok, visitor} = Visitors.create_visitor(@valid_visitor_attrs)
      valid_attrs = %{ @valid_attrs | visitor_id: visitor.id}
      {:ok, contact} =
        attrs
        |> Enum.into(valid_attrs)
        |> Contacts.create_contact()

      contact
    end

    test "list_contacts/0 returns all contacts" do
      contact = contact_fixture()
      assert Contacts.list_contacts() == [contact]
    end

    test "get_contact!/1 returns the contact with given id" do
      contact = contact_fixture()
      assert Contacts.get_contact!(contact.id) == contact
    end

    test "create_contact/1 with valid data creates a contact" do
      {:ok, visitor} = Visitors.create_visitor(@valid_visitor_attrs)
      valid_attrs = %{ @valid_attrs | visitor_id: visitor.id}
      assert {:ok, %Contact{} = contact} = Contacts.create_contact(valid_attrs)
      assert contact.email == "some email"
      assert contact.firstname == "some firstname"
      assert contact.lastname == "some lastname"
      assert contact.phone == "some phone"
    end

    test "create_contact/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Contacts.create_contact(@invalid_attrs)
    end

    test "update_contact/2 with valid data updates the contact" do
      contact = contact_fixture()
      valid_attrs = %{ @update_attrs | visitor_id: contact.visitor_id}
      assert {:ok, contact} = Contacts.update_contact(contact, valid_attrs)
      assert %Contact{} = contact
      assert contact.email == "some updated email"
      assert contact.firstname == "some updated firstname"
      assert contact.lastname == "some updated lastname"
      assert contact.phone == "some updated phone"
    end

    test "update_contact/2 with invalid data returns error changeset" do
      contact = contact_fixture()
      assert {:error, %Ecto.Changeset{}} = Contacts.update_contact(contact, @invalid_attrs)
      assert contact == Contacts.get_contact!(contact.id)
    end

    test "delete_contact/1 deletes the contact" do
      contact = contact_fixture()
      assert {:ok, %Contact{}} = Contacts.delete_contact(contact)
      assert_raise Ecto.NoResultsError, fn -> Contacts.get_contact!(contact.id) end
    end

    test "change_contact/1 returns a contact changeset" do
      contact = contact_fixture()
      assert %Ecto.Changeset{} = Contacts.change_contact(contact)
    end
  end
end
