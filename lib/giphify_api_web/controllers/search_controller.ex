defmodule GiphifyApiWeb.SearchController do
  use GiphifyApiWeb, :controller

  import Ecto.Query, warn: false
  alias GiphifyApi.Repo
  alias GiphifyApi.Search

  action_fallback GiphifyApiWeb.FallbackController

  def store_search(attrs \\ %{}) do
    %Search{}
    |> Search.changeset(attrs)
    |> Repo.insert()
  end

  def create(conn, %{"query" => search_params}) do
    with {:ok, %Search{} = search} <- store_search(search_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", search_path(conn, :show, search))
      |> render("show.json", search: search)
    end
  end
end


