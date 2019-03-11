defmodule StatsWeb.UploadController do
  use StatsWeb, :controller
  alias Stats.UploadParser

  def upload(conn, %{"stats" => stats}) do
    stats = UploadParser.Football.parse(stats)

    # There are duplicated players present in the MapSet, although MapSet should not allow them.
    players = stats.players |> MapSet.to_list() |> Enum.uniq_by(fn p -> p["player_id"] end)

    try do
      Ecto.Multi.new()
      |> Ecto.Multi.insert_all(:insert_all_player, "football_players", players)
      |> Ecto.Multi.insert_all(:insert_all_kicking, "football_kicking_stats", stats.kicking)
      |> Ecto.Multi.insert_all(:insert_all_passing, "football_passing_stats", stats.passing)
      |> Ecto.Multi.insert_all(:insert_all_receiving, "football_receiving_stats", stats.receiving)
      |> Ecto.Multi.insert_all(:insert_all_rushing, "football_rushing_stats", stats.rushing)
      |> Stats.Repo.transaction()

      send_resp(conn, :no_content, "")
    rescue
      _ ->
        send_resp(
          conn,
          :unprocessable_entity,
          Jason.encode!(%{
            message: "An error occurred attempting to store the uploaded stats data"
          })
        )
    end
  end
end
