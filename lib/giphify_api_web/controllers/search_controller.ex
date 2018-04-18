defmodule GiphifyApiWeb.SearchController do
  use GiphifyApiWeb, :controller

  alias GiphifyApi.Repo
  alias GiphifyApi.Query
  alias GiphifyApi.Search

  def create(conn, %{"query" => query_params}) do
    with {:ok, %Search{} = query} <- Query.create_search(%{"query" => query_params}) do
      conn
      |> put_status(:created)
      |> send_resp(201, "")
    end
  end
end
