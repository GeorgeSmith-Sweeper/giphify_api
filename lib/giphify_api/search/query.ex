defmodule GiphifyApi.Query do
  import Ecto.Query
  alias GiphifyApi.Repo
  alias GiphifyApi.Search

  def create_search(attrs) do
    %Search{}
    |> Search.changeset(attrs)
    |> Repo.insert()
  end

  def list_search_queries do
    Repo.all(from s in Search, select: s.query)
  end
end
