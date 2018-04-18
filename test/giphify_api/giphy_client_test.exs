defmodule GiphifyApi.GiphyClientTest do
  use ExUnit.Case

  alias GiphifyApi.GiphyClient

  describe "wrapping giphy" do

    test "process_url/1 returns a fully built url" do
      url = "anything"
      expectedUrl = "https://api.giphy.com/v1/anything"

      assert GiphyClient.process_url(url) == expectedUrl
    end
  end
end

