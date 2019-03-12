defmodule Stats.Repo.Migrations.CreateFootballPassingStats do
  use Ecto.Migration

  def change do
    create table(:football_passing_stats) do
      add :att, :string
      add :entry_id, :string
      add :position, :string
      add :yds, :string
      add :tds, :string
      add :cmp, :string
      add :int, :string

      add :player_id,
          references(:football_players, column: :player_id, type: :string, on_delete: :nothing)

      timestamps()
    end

    create index(:football_passing_stats, [:player_id])
    create unique_index(:football_passing_stats, [:entry_id])
  end
end
