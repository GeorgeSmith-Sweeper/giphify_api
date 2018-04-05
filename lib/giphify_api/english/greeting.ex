defmodule GiphifyApi.English.Greeting do
  use Ecto.Schema
  import Ecto.Changeset


  schema "greetings" do
    field :phrase, :string

    timestamps()
  end

  @doc false
  def changeset(greeting, attrs) do
    greeting
    |> cast(attrs, [:phrase])
    |> validate_required([:phrase])
  end
end
