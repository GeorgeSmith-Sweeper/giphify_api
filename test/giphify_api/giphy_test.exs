defmodule GiphifyApi.GiphyClientTest do
  use ExUnit.Case, async: true

  alias GiphifyApi.GiphyClient

  describe "getting a url from giphy"
  test "a successful attempt returns the GifUrl" do
    assert { :ok, new_conn } = GiphyClient.get_gif_url(conn, conn.params)
  end

end

