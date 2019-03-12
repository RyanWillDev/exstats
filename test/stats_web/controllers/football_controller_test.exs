defmodule StatsWeb.FootballControllerTest do
  use StatsWeb.ConnCase
  alias Stats.Football

  describe "list all players" do
    setup [:create_player]

    test "should return a list of all players", %{conn: conn} do
      conn = get(conn, Routes.football_path(conn, :list_players))

      assert json_response(conn, 200) == [
               %{
                 "name" => "Charlie Whitehurst",
                 "id" => "34cc7f47-9f14-4661-b9af-c9d3b2fc873a"
               }
             ]
    end
  end

  describe "retreiving list of stats by player_id" do
    setup [:create_player, :create_stats]

    test "returns a list of all stats for a given player_id(s) when provided a list of player_id(s)",
         %{conn: conn} do
      %{
        kicking: kicking,
        passing: passing,
        receiving: receiving,
        rushing: rushing
      } = stats_data()

      conn =
        get(conn, Routes.football_path(conn, :get), %{
          "players" => "34cc7f47-9f14-4661-b9af-c9d3b2fc873a"
        })

      assert json_response(conn, 200) == %{
               "kicking" => [kicking],
               "passing" => [passing],
               "receiving" => [receiving],
               "rushing" => [rushing]
             }
    end

    test "returns a 400 if list of player_id(s) is empty", %{conn: conn} do
      conn = get(conn, Routes.football_path(conn, :get), %{"players" => ""})

      assert %{"error" => "Invalid list of player ids."} == json_response(conn, 400)
    end

    test "when no list of player_id(s) is provided returns all stats", %{conn: conn} do
      %{
        kicking: kicking,
        passing: passing,
        receiving: receiving,
        rushing: rushing
      } = stats_data()

      conn = get(conn, Routes.football_path(conn, :get))

      assert json_response(conn, 200) == %{
               "kicking" => [kicking],
               "passing" => [passing],
               "receiving" => [receiving],
               "rushing" => [rushing]
             }
    end
  end

  defp fixture(:player) do
    %{name: "Charlie Whitehurst", player_id: "34cc7f47-9f14-4661-b9af-c9d3b2fc873a"}
    |> Football.create_player()
  end

  defp create_player(_) do
    {:ok, player} = fixture(:player)

    %{player: player}
  end

  defp create_stats(_) do
    {:ok, _} = Football.create_kicking(stats_data().kicking)
    {:ok, _} = Football.create_passing(stats_data().passing)
    {:ok, _} = Football.create_receiving(stats_data().receiving)
    {:ok, _} = Football.create_rushing(stats_data().rushing)

    :ok
  end

  defp stats_data do
    %{
      kicking: %{
        "player_id" => "34cc7f47-9f14-4661-b9af-c9d3b2fc873a",
        "entry_id" => "596c4000-ede5-45b0-8336-33efeb686d2b2014REG4ki",
        "name" => "Charlie Whitehurst",
        "position" => "K",
        "fld_goals_made" => "1",
        "fld_goals_att" => "1",
        "extra_pt_made" => "5",
        "extra_pt_att" => "5"
      },
      passing: %{
        "name" => "Charlie Whitehurst",
        "player_id" => "34cc7f47-9f14-4661-b9af-c9d3b2fc873a",
        "entry_id" => "34cc7f47-9f14-4661-b9af-c9d3b2fc873a2014REG4pa",
        "position" => "QB",
        "yds" => "177",
        "att" => "23",
        "tds" => "1",
        "cmp" => "12",
        "int" => "1"
      },
      receiving: %{
        "name" => "Charlie Whitehurst",
        "player_id" => "34cc7f47-9f14-4661-b9af-c9d3b2fc873a",
        "entry_id" => "bd413539-9351-454e-9d61-4e8635d7e9f52014REG4re",
        "position" => "TE",
        "yds" => "7",
        "tds" => "0",
        "rec" => "1"
      },
      rushing: %{
        "name" => "Charlie Whitehurst",
        "player_id" => "34cc7f47-9f14-4661-b9af-c9d3b2fc873a",
        "entry_id" => "8f22eb36-5282-407a-b6f9-f9b62e5f73182014REG4ru",
        "position" => "RB",
        "yds" => "32",
        "att" => "9",
        "tds" => "0",
        "fum" => "0"
      }
    }
  end
end
