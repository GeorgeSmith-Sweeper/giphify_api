defmodule GiphifyApiWeb.SearchController do
  use GiphifyApiWeb, :controller

  alias GiphifyApi.Repo
  alias GiphifyApi.Search

  def store_query(attrs) do
    %Search{}
    |> Search.changeset(attrs)
    |> Repo.insert()
  end

  def create(conn, %{"query" => query_params}) do
    with {:ok, %Search{} = query} <- store_query(%{"query" => query_params}) do
      conn
      |> put_status(:created)
      |> send_resp(201, "")
    end
  end
end
