defmodule Stats.Repo.Migrations.CreateFootballRushingStats do
  use Ecto.Migration

  def change do
    create table(:football_rushing_stats) do
      add :entry_id, :string
      add :position, :string
      add :yds, :integer
      add :att, :integer
      add :tds, :integer
      add :fum, :integer

      add :player_id,
          references(:football_players, column: :player_id, type: :uuid, on_delete: :nothing)

      timestamps()
    end

    create index(:football_rushing_stats, [:player_id])
  end
end
