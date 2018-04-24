defmodule GiphifyApi.Giphy do
  alias HTTPoison

  def call do
    search_query = "Dog"
    GiphifyApi.GiphySearch.get_gif(search_query)
  end
end

defmodule GiphifyApi.GiphySearch do
  def get_gif(search_query) do
    api_key = Application.get_env(:giphify_api, :giphy_key)

    url = "https://api.giphy.com/v1/gifs/translate?api_key=#{api_key}&s=#{search_query}"

    HTTPoison.get!(url)
      |> Map.get(:body)
      |> Poison.decode!(keys: :atoms)
      |> Map.get(:data)
      |> Map.get(:embed_url)
  end
end
