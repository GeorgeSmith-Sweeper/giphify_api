defmodule GiphifyApi.QueryTest do
  use GiphifyApi.DataCase

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
  end
end
