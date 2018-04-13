defmodule GiphifyApiWeb.SearchController do
  use GiphifyApiWeb, :controller

  import Ecto.Query, warn: false
  alias GiphifyApi.Repo
  alias GiphifyApi.Search

  action_fallback GiphifyApiWeb.FallbackController

  def store_query(attrs) do
    %Search{}
    |> Search.changeset(attrs)
    |> Repo.insert()
  end

  def create(conn, params) do
    case store_query(params) do
      {:ok, query} ->
        conn
        |> put_status(:created)
        |> send_resp(201, query)
      else
        {:error, %{errors: errors}} ->
          conn
          |> put_status(:bad_request)
          |> send_resp(422, errors)
    end
  end
end
