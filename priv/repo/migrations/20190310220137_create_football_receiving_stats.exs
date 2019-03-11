defmodule Stats.Repo.Migrations.CreateFootballReceivingStats do
  use Ecto.Migration

  def change do
    create table(:football_receiving_stats) do
      add :entry_id, :string
      add :position, :string
      add :yds, :string
      add :tds, :string
      add :rec, :string

      add :player_id,
          references(:football_players, column: :player_id, type: :string, on_delete: :nothing)

      timestamps()
    end

    create index(:football_receiving_stats, [:player_id])
  end
end
