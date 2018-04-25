defmodule GiphifyApi.Query do
  import Ecto.Query
  import Ecto.Changeset

  alias GiphifyApi.Repo
  alias GiphifyApi.Search
  alias GiphifyApi.Giphy

  def create_search(attrs \\ %{}) do
    %Search{}
    |> Search.changeset(attrs)
    |> Repo.insert()
  end

  def store_gif_url() do
    url = Giphy.call()
    last_query = get_last_query()
    last_query = Ecto.Changeset.change last_query, gif_url: url
    Repo.update!(last_query)
  end

  def list_search_queries do
    Repo.all(from s in Search, select: s.query)
  end

  def get_last_query do
    Repo.one(from x in Search, order_by: [desc: x.id], limit: 1)
  end
end
