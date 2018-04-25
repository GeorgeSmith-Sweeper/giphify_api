defmodule GiphifyApi.QueryTest do
  use GiphifyApi.DataCase
  import Mox

  alias GiphifyApi.Query

  describe "queries" do
    alias GiphifyApi.Search

    @valid_attrs %{query: "Ham and Cheese"}
    @invalid_attrs %{query: nil}

    def search_fixture(attrs \\ %{}) do
      {:ok, search} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Query.create_search()
      search
    end

    test "create_search/1 with valid data creates a search" do
      assert {:ok, %Search{} = search} = Query.create_search(@valid_attrs)
      assert search.query == "Ham and Cheese"
    end

    test "create_search/1 with invalid data" do
      changeset = Search.changeset(%Search{}, @invalid_attrs)
      refute changeset.valid?
    end

    test "list_search_queries/0 returns a list of all queries in the database" do
      search = search_fixture()
      assert Query.list_search_queries() == [search.query]
    end

    test "get_last_query/0 returns the last query in the database" do
      search = search_fixture()
      assert Query.get_last_query() == search
    end

    test "store_gif_url/0 returns the " do
    GiphifyApi.GiphySearch.MockClient
    |> expect(:get_gif, fn "Dog" ->
        "https://itworks.com"
      end)
      search = search_fixture()
      assert Query.store_gif_url() == search
    end
  end
end
