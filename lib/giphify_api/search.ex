defmodule GiphifyApi.Search do
  use Ecto.Schema
  import Ecto.Changeset

  schema "searches" do
    field :query, :string

    timestamps()
  end

  def changeset(search, params \\ %{}) do
    search
    |> cast(params, [:query])
    |> validate_required([:query])
  end
end
