defmodule PageAccessTrackerWeb.ContactViewerController do
  use PageAccessTrackerWeb, :controller

  alias PageAccessTracker.Contacts
  alias PageAccessTracker.AccessedPages

  def index(conn, _params) do
    contacts = Contacts.list_contacts()
    render(conn, "index.html", contacts: contacts)
  end

  def show(conn, %{"id" => id}) do
    accessedPages = AccessedPages.list_pages_accesseds(id)

    render(conn, "show.html", accessedPages: accessedPages)
  end
end
