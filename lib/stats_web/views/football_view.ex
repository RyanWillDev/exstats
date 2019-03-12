defmodule StatsWeb.FootballView do
  use StatsWeb, :view
  alias StatsWeb.FootballView

  def render("football_stats.json", %{stats: stats}) do
    %{
      kicking: render_many(stats.kicking, FootballView, "kicking_stat.json", as: :stat),
      passing: render_many(stats.passing, FootballView, "passing_stat.json", as: :stat),
      receiving: render_many(stats.receiving, FootballView, "receiving_stat.json", as: :stat),
      rushing: render_many(stats.rushing, FootballView, "rushing_stat.json", as: :stat)
    }
  end

  def render("kicking_stat.json", %{stat: stat}) do
    %{
      fld_goals_made: stat.fld_goals_made,
      fld_goals_att: stat.fld_goals_att,
      extra_pt_made: stat.extra_pt_made,
      extra_pt_att: stat.extra_pt_att
    }
    |> add_common_data(stat)
  end

  def render("passing_stat.json", %{stat: stat}) do
    %{
      att: stat.att,
      cmp: stat.cmp,
      int: stat.int,
      tds: stat.tds,
      yds: stat.yds
    }
    |> add_common_data(stat)
  end

  def render("receiving_stat.json", %{stat: stat}) do
    %{
      rec: stat.rec,
      tds: stat.tds,
      yds: stat.yds
    }
    |> add_common_data(stat)
  end

  def render("rushing_stat.json", %{stat: stat}) do
    %{
      att: stat.att,
      fum: stat.fum,
      tds: stat.tds,
      yds: stat.yds
    }
    |> add_common_data(stat)
  end

  def render("players.json", %{players: players}) do
    render_many(players, FootballView, "player.json", as: :player)
  end

  def render("player.json", %{player: player}) do
    %{
      name: player.name,
      id: player.player_id
    }
  end

  defp add_common_data(stat_data, stat) do
    player = Map.take(stat.player, [:player_id, :name])

    Map.take(stat, [:entry_id, :position])
    |> Map.merge(stat_data)
    |> Map.merge(player)
  end
end
