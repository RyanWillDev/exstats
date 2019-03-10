defmodule Stats.Repo.Migrations.CreateFootballKickingStats do
  use Ecto.Migration

  def change do
    create table(:football_kicking_stats) do
      add :entry_id, :string
      add :position, :string
      add :fld_goals_made, :integer
      add :fld_goals_att, :integer
      add :extra_pt_made, :integer
      add :extra_pt_att, :integer

      add :player_id,
          references(:football_players, column: :player_id, type: :uuid, on_delete: :nothing)

      timestamps()
    end

    create index(:football_kicking_stats, [:player_id])
  end
end
