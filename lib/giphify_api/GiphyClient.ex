defmodule GiphifyApi.GiphyClient do
  use HTTPoison.Base

  def process_url(url) do
    "https://api.giphy.com/v1/" <> url
  end

end
