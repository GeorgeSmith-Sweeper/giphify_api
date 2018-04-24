defmodule GiphifyApi.GiphyTest do
  use ExUnit.Case, async: true
  import Mox

  # check that mock have been called
  setup :verify_on_exit!

  test "Mock client gets defined url" do
    GiphifyApi.GiphySearch.MockClient
    |> expect(:get_gif, fn _ ->
        {:ok, %{embed_url: "https://itworks.com"}}
      end)
    assert GiphifyApi.Giphy.call() == {:ok, %{embed_url: "https://itworks.com"}}
  end
end


