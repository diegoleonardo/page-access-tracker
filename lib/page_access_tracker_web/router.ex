defmodule PageAccessTrackerWeb.Router do
  use PageAccessTrackerWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", PageAccessTrackerWeb do
    pipe_through :browser # Use the default browser stack

    resources "/", ContactViewerController
    # get "/", PageController, :index
    
  end

  # Other scopes may use custom stacks.
  scope "/api", PageAccessTrackerWeb do
    pipe_through :api

    resources "/visitors", VisitorController

    resources "/accessed_pages", AccessedPageController

    resources "/contacts", ContactController, except: [:new, :edit]
  end
end
