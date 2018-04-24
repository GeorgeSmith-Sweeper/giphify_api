defmodule GiphifyApi.Search do
  use Ecto.Schema
  import Ecto.Changeset

  schema "searches" do
    field :query, :string
    field :gif_url, :string

    timestamps()
  end

  def changeset(search, params \\ %{}) do
    search
    |> cast(params, [:query, :gif_url])
    |> validate_required([:query])
  end
end
