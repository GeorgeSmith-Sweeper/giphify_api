ExUnit.start()

Ecto.Adapters.SQL.Sandbox.mode(GiphifyApi.Repo, :manual)

Mox.defmock(GiphifyApi.GiphySearch.MockClient, for: GiphifyApi.GiphySearch)
