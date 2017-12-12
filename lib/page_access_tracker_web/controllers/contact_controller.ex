defmodule PageAccessTrackerWeb.ContactController do
  use PageAccessTrackerWeb, :controller

  alias PageAccessTracker.Contacts
  alias PageAccessTracker.Contacts.Contact

  action_fallback PageAccessTrackerWeb.FallbackController

  def create(conn, %{"contact" => contact_params}) do
    with {:ok, %Contact{} = contact} <- Contacts.create_contact(contact_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", contact_path(conn, :show, contact))
      |> render("show.json", contact: contact)
    end
  end
end
