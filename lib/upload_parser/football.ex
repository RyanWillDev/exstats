defmodule Stats.UploadParser.Football do
  @moduledoc """
  Parser for football stats
  """

  @keys_for_stat_type %{
    "rushing" => ["entry_id", "player_id", "position", "yds", "att", "tds", "fum"],
    "kicking" => [
      "entry_id",
      "extra_pt_att",
      "extra_pt_made",
      "fld_goals_att",
      "fld_goals_made",
      "player_id",
      "position"
    ],
    "receiving" => ["entry_id", "player_id", "position", "yds", "tds", "rec"],
    "passing" => ["entry_id", "player_id", "position", "yds", "att", "tds", "cmp", "int"]
  }

  def parse(stats) do
    [
      {_, {:ok, rushing_stats}},
      {_, {:ok, passing_stats}},
      {_, {:ok, receiving_stats}},
      {_, {:ok, kicking_stats}}
    ] =
      ["rushing", "passing", "receiving", "kicking"]
      |> Enum.map(fn type -> Task.async(fn -> get_stats(stats, type) end) end)
      |> Task.yield_many()

    players =
      [
        rushing_stats.players,
        passing_stats.players,
        receiving_stats.players,
        kicking_stats.players
      ]
      |> Enum.reduce(MapSet.new(), fn acc, players ->
        MapSet.union(acc, players)
      end)

      # There are duplicated players present in the MapSet, although MapSet should not allow them.
      |> MapSet.to_list()
      |> Enum.uniq_by(fn p -> p["player_id"] end)

    %{
      rushing: rushing_stats.stats_data,
      passing: passing_stats.stats_data,
      receiving: receiving_stats.stats_data,
      kicking: kicking_stats.stats_data,
      players: players
    }
  end

  defp get_stats(stats, type) do
    traverse_stats(stats[type], %{players: MapSet.new(), stats_data: []}, %{
      player_keys: ["player_id", "name"],
      stat_keys: @keys_for_stat_type[type],
      timestamps: %{"updated_at" => DateTime.utc_now(), "inserted_at" => DateTime.utc_now()}
    })
  end

  defp traverse_stats([], stats_data, _) do
    stats_data
  end

  defp traverse_stats(
         [head | tail],
         %{players: players, stats_data: stats_data},
         %{
           player_keys: player_keys,
           stat_keys: stat_keys,
           timestamps: timestamps
         } = meta
       ) do
    stats_data =
      head
      |> Map.take(stat_keys)
      |> (fn new_stat ->
            [Map.merge(new_stat, timestamps) | stats_data]
          end).()

    players =
      head
      |> Map.take(player_keys)
      |> (fn new_player ->
            new_player = Map.merge(new_player, timestamps)
            MapSet.put(players, new_player)
          end).()

    traverse_stats(tail, %{players: players, stats_data: stats_data}, meta)
  end
end
