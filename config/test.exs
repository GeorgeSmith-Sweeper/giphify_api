use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :giphify_api, GiphifyApiWeb.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :giphify_api, GiphifyApi.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "8thlight",
  password: "123456",
  database: "giphify_api_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
