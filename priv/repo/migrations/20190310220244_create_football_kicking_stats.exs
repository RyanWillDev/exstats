defmodule Stats.Repo.Migrations.CreateFootballKickingStats do
  use Ecto.Migration

  def change do
    create table(:football_kicking_stats) do
      add :entry_id, :string
      add :position, :string
      add :fld_goals_made, :string
      add :fld_goals_att, :string
      add :extra_pt_made, :string
      add :extra_pt_att, :string

      add :player_id,
          references(:football_players, column: :player_id, type: :string, on_delete: :nothing)

      timestamps()
    end

    create index(:football_kicking_stats, [:player_id])
    create unique_index(:football_kicking_stats, [:entry_id])
  end
end
