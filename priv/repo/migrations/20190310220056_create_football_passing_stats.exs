defmodule Stats.Repo.Migrations.CreateFootballPassingStats do
  use Ecto.Migration

  def change do
    create table(:football_passing_stats) do
      add :entry_id, :string
      add :position, :string
      add :yds, :integer
      add :tds, :integer
      add :cmp, :integer
      add :int, :integer

      add :player_id,
          references(:football_players, column: :player_id, type: :uuid, on_delete: :nothing)

      timestamps()
    end

    create index(:football_passing_stats, [:player_id])
  end
end
