defmodule StatsWeb.FootballController do
  use StatsWeb, :controller

  alias Stats.Football

  @spec get(Plug.Conn.t(), map()) :: Plug.Conn.t()
  def get(conn, %{"players" => player_ids}) when is_binary(player_ids) and player_ids != "" do
    player_ids = String.split(player_ids, ",", trim: true)
    stats = Football.stats_by_players(player_ids)

    render(conn, "football_stats.json", stats: stats)
  end

  def get(conn, _) do
    conn
    |> put_view(StatsWeb.ErrorView)
    |> put_status(:bad_request)
    |> render("400.json", %{message: "Invalid list of player ids."})
  end

  @spec list_players(Plug.Conn.t(), any()) :: Plug.Conn.t()
  def list_players(conn, _params) do
    players = Football.list_football_players()

    render(conn, "players.json", players: players)
  end
end
