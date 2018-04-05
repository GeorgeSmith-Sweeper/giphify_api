defmodule GiphifyApi.Repo.Migrations.CreateGreetings do
  use Ecto.Migration

  def change do
    create table(:greetings) do
      add :phrase, :string

      timestamps()
    end

  end
end
