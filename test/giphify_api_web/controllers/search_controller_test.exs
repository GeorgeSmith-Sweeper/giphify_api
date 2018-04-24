defmodule GiphifyApiWeb.SearchControllerTest do
  use GiphifyApiWeb.ConnCase

  alias GiphifyApi.Search
  alias GiphifyApi.Query

  @create_attrs %{query: "Wine and Dine"}
  @invalid_attrs %{phrase: nil}

  def fixture(:search) do
    {:ok, search} = Query.create_search(@create_attrs)
    search
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end
end
