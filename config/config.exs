# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :optiwait,
  ecto_repos: [Optiwait.Repo]

# Configures the endpoint
config :optiwait, Optiwait.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "V/GXd13RLbxMcxL+Aj4jnfsoY/DAlNxD+Lw+IdhBi3lJ9XfaU7AiBGpI612f5qkE",
  render_errors: [view: Optiwait.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Optiwait.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :guardian, Guardian,
  allowed_algos: ["HS512", "HS384"],
  issuer: "MyApp",
  ttl: { 30, :days },
  serializer: Optiwait.GuardianSerializer,
  secret_key: "mysecret"

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
