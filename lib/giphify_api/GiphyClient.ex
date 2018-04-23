# defmodule GiphifyApi.GiphyClient do
#   use HTTPoison.Base

#   @resource "https://api.giphy.com/v1"
#   @endpoint "gifs/translate"

#   def process_url(apiKey, params) do
#     "#{@resource}/#{@endpoint}?api_key=#{apiKey}&s=#{params}"
#   end
# end


defmodule GiphifyApi.GiphyClient do
  use HTTPoison.Base

  @expected_fields ~w(
    data
  )

  def process_url(url) do
    "https://api.giphy.com/v1" <> url
  end

  def process_response_body(body) do
    body
    |> Poison.decode!
    |> Map.take(@expected_fields)
    |> Enum.map(fn({k, v}) -> {String.to_atom(k), v} end)
  end
end
