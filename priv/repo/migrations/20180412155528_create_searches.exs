defmodule GiphifyApi.Repo.Migrations.CreateSearches do
  use Ecto.Migration

  def change do
    create table(:searches) do
      add :query, :string
      timestamps()
    end
  end
end
