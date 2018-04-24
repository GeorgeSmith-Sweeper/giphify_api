# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :giphify_api,
  ecto_repos: [GiphifyApi.Repo],
  giphy_key:

config :giphify_api, :giphy_search, GiphifyApi.GiphySearch.HttpClient
# Configures the endpoint
config :giphify_api, GiphifyApiWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "i9zoJo+AAIBdSzbj1bGyf0OTQ/SvMkFJZkZ2IgAa9PkR7WVOt1smOzccC+hpjaCP",
  render_errors: [view: GiphifyApiWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: GiphifyApi.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
