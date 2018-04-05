defmodule GiphifyApiWeb.GreetingController do
  use GiphifyApiWeb, :controller

  alias GiphifyApi.English
  alias GiphifyApi.English.Greeting

  action_fallback GiphifyApiWeb.FallbackController

  def index(conn, _params) do
    greetings = English.list_greetings()
    render(conn, "index.json", greetings: greetings)
  end

  def create(conn, %{"greeting" => greeting_params}) do
    with {:ok, %Greeting{} = greeting} <- English.create_greeting(greeting_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", greeting_path(conn, :show, greeting))
      |> render("show.json", greeting: greeting)
    end
  end

  def show(conn, %{"id" => id}) do
    greeting = English.get_greeting!(id)
    render(conn, "show.json", greeting: greeting)
  end

  def update(conn, %{"id" => id, "greeting" => greeting_params}) do
    greeting = English.get_greeting!(id)

    with {:ok, %Greeting{} = greeting} <- English.update_greeting(greeting, greeting_params) do
      render(conn, "show.json", greeting: greeting)
    end
  end

  def delete(conn, %{"id" => id}) do
    greeting = English.get_greeting!(id)
    with {:ok, %Greeting{}} <- English.delete_greeting(greeting) do
      send_resp(conn, :no_content, "")
    end
  end
end
