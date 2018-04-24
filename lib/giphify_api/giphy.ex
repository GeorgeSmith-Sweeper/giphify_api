
defmodule GiphifyApi.Giphy do
  alias HTTPoison

  # module method
  @giphy_search Application.get_env(:giphify_api, :giphy_search)
  def call do
    search_query = "Dog"
    @giphy_search.get_gif(search_query)
  end
end


defmodule GiphifyApi.GiphySearch do
  @callback get_gif(search_query :: String.t()) :: {:ok, String.t()}
end


defmodule GiphifyApi.GiphySearch.HttpClient do
  @behaviour GiphifyApi.GiphySearch

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
