defmodule GiphifyApi.Giphy do
  alias HTTPoison

  def call do
    search_query = "Dog"
    get_gif_url(search_query)
  end

  defp get_gif_url(search_query) do
    api_key = Application.get_env(:giphify_api, :giphy_key)
    IO.puts(api_key)

    url = "https://api.giphy.com/v1/gifs/translate?api_key=#{api_key}&s=#{search_query}"

    HTTPoison.get!(url)
      |> Map.get(:body)
      |> Poison.decode!()
  end
end
