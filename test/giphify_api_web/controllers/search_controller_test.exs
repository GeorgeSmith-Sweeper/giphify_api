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

  # describe "create search" do
  #   test "responds with a 201 when data is valid", %{conn: conn} do

  #     conn = post conn, search_path(conn, :create), search: @create_attrs
  #     assert %{"id" => id} = json_response(conn, 201)["data"]
  #   end
  # end
end
