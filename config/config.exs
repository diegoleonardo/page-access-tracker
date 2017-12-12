# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :page_access_tracker,
  ecto_repos: [PageAccessTracker.Repo]

# Configures the endpoint
config :page_access_tracker, PageAccessTrackerWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "ca3vHIIjt4sQfUH/ggXMryyk7PDjgNdkejrhsGq8FhmvFHuaO+gBv+Nmfl+xYGO3",
  render_errors: [view: PageAccessTrackerWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: PageAccessTracker.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
