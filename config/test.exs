use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :optiwait, Optiwait.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :optiwait, Optiwait.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "graphql",
  password: "graphql",
  database: "optiwait_dev_test",
  hostname: "localhost",
  port: "15432",
  pool: Ecto.Adapters.SQL.Sandbox
