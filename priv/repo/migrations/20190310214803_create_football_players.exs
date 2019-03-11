defmodule Stats.Repo.Migrations.CreateFootballPlayers do
  use Ecto.Migration

  def change do
    create table(:football_players) do
      add :name, :string
      add :player_id, :string

      timestamps()
    end

    create unique_index(:football_players, :player_id)
  end
end
