# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :user_api,
  ecto_repos: [UserApi.Repo]

# Configures the endpoint
config :user_api, UserApiWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "YzzgKhaT7BUcol2GVUk9OrAE+SRzTVtiWE54GcAvbcJT1DRrY85tM4+VzD6Hzgoa",
  render_errors: [view: UserApiWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: UserApi.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
