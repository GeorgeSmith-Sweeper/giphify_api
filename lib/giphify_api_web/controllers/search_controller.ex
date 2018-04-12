defmodule GiphifyApiWeb.SearchController do
  use GiphifyApiWeb, :controller

  alias GiphifyApi.Search
  alias GiphifyApi.Repo

  action_fallback GiphifyApiWeb.FallbackController

  defp store_search(attrs \\ %{}) do
    %Search{}
    |> Search.changeset(attrs)
    |> Repo.insert()
  end

  def create(conn, %{"search" => search_params}) do
    with {:ok, %Search{} = search} <- store_search(search_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", search_path(conn, :show, greeting))
      |> render("show.json", search: search)
    end
  end
end
