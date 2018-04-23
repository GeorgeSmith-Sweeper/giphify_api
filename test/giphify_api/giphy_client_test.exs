defmodule GiphifyApi.GiphyClientTest do
  use ExUnit.Case

  alias GiphifyApi.GiphyClient

  describe "wrapping giphy" do

    test "process_url/1 returns a fully built url" do
      apiKey = "1010"
      endpoint = "gifs/translate"
      params = "Winter"
      expectedUrl = "https://api.giphy.com/v1/gifs/translate?api_key=1010&s=Winter"

      assert GiphyClient.process_url(apiKey, params) == expectedUrl
    end

    test ""
  end
end

