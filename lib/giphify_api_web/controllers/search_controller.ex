defmodule GiphifyApiWeb.SearchController do
  use GiphifyApiWeb, :controller

  import Ecto.Query, warn: false
  alias GiphifyApi.Repo
  alias GiphifyApi.Search

  action_fallback GiphifyApiWeb.FallbackController

  def store_query(attrs \\ %{}) do
    %Search{}
    |> Search.changeset(attrs)
    |> Repo.insert()
  end

  def create(conn, %{"query" => query_params}) do
    case store_query(query_params) do
      {:ok, query} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", search_path(conn, :show, query))
        |> render("show.json", query: query)
      {:error, query} ->
        conn
        |> put_flash(:error, "Something went wrong")
        |> render("show.json", query: query)
    end
  end










  # def create(conn, %{"query" => query_params}) do
  #   with {:ok, %Search{} = query} <- store_query(query_params) do
  #     conn
  #     |> put_status(:created)
  #     |> put_resp_header("location", search_path(conn, :show, query))
  #     |> render("show.json", query: query)
  #   end
  # end
end


