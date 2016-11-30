# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :pizzachat,
  ecto_repos: [Pizzachat.Repo]

# Configures the endpoint
config :pizzachat, Pizzachat.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "ChipmCkDgOqLxsjW75gm4t1l8pru4g85Npe/QUOBgm3zRSgOSPrK5Fz/UmVjfYtr",
  render_errors: [view: Pizzachat.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Pizzachat.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
