defmodule Stats.Repo.Migrations.CreateFootballRushingStats do
  use Ecto.Migration

  def change do
    create table(:football_rushing_stats) do
      add :entry_id, :string
      add :position, :string
      add :yds, :string
      add :att, :string
      add :tds, :string
      add :fum, :string

      add :player_id,
          references(:football_players, column: :player_id, type: :string, on_delete: :nothing)

      timestamps()
    end

    create index(:football_rushing_stats, [:player_id])
  end
end
