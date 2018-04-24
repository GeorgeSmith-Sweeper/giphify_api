defmodule GiphifyApi.Repo.Migrations.UpdateSearchesTable do
  use Ecto.Migration

  def change do
    alter table(:searches) do
      add :gif_url, :string
    end
  end
end
