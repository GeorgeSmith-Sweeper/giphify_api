defmodule GiphifyApiWeb.Router do
  use GiphifyApiWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", GiphifyApiWeb do
    pipe_through :api

    resources "/greetings", GreetingController, except: [:new, :edit]
  end
end
