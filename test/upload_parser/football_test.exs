defmodule Stats.UploadParser.FootballTest do
  alias Stats.UploadParser.Football

  use ExUnit.Case

  describe "parsing football stats" do
    test "returns a MapSet of all players" do
      %{players: players} = Football.parse(stats_data())

      assert length(players) == 4
    end

    test "returns lists of all uploaded stats" do
      %{kicking: kicking, passing: passing, receiving: receiving, rushing: rushing} =
        Football.parse(stats_data())

      assert [
               %{
                 "position" => "K",
                 "fld_goals_made" => "1",
                 "fld_goals_att" => "1",
                 "extra_pt_made" => "5",
                 "extra_pt_att" => "5",
                 "inserted_at" => _,
                 "updated_at" => _
               }
             ] = kicking

      assert [
               %{
                 "yds" => "177",
                 "att" => "23",
                 "tds" => "1",
                 "cmp" => "12",
                 "int" => "1",
                 "inserted_at" => _,
                 "updated_at" => _
               }
             ] = passing

      assert [
               %{
                 "position" => "TE",
                 "yds" => "7",
                 "tds" => "0",
                 "rec" => "1",
                 "inserted_at" => _,
                 "updated_at" => _
               }
             ] = receiving

      assert [
               %{
                 "position" => "RB",
                 "yds" => "32",
                 "att" => "9",
                 "tds" => "0",
                 "fum" => "0",
                 "inserted_at" => _,
                 "updated_at" => _
               }
             ] = rushing
    end
  end

  def stats_data do
    %{
      "kicking" => [
        %{
          "player_id" => "596c4000-ede5-45b0-8336-33efeb686d2b",
          "entry_id" => "596c4000-ede5-45b0-8336-33efeb686d2b2014REG4ki",
          "name" => "Caleb Sturgis",
          "position" => "K",
          "fld_goals_made" => "1",
          "fld_goals_att" => "1",
          "extra_pt_made" => "5",
          "extra_pt_att" => "5"
        }
      ],
      "passing" => [
        %{
          "player_id" => "34cc7f47-9f14-4661-b9af-c9d3b2fc873a",
          "entry_id" => "34cc7f47-9f14-4661-b9af-c9d3b2fc873a2014REG4pa",
          "name" => "Charlie Whitehurst",
          "position" => "QB",
          "yds" => "177",
          "att" => "23",
          "tds" => "1",
          "cmp" => "12",
          "int" => "1"
        }
      ],
      "receiving" => [
        %{
          "player_id" => "bd413539-9351-454e-9d61-4e8635d7e9f5",
          "entry_id" => "bd413539-9351-454e-9d61-4e8635d7e9f52014REG4re",
          "name" => "Jack Doyle",
          "position" => "TE",
          "yds" => "7",
          "tds" => "0",
          "rec" => "1"
        }
      ],
      "rushing" => [
        %{
          "player_id" => "8f22eb36-5282-407a-b6f9-f9b62e5f7318",
          "entry_id" => "8f22eb36-5282-407a-b6f9-f9b62e5f73182014REG4ru",
          "name" => "Ahmad Bradshaw",
          "position" => "RB",
          "yds" => "32",
          "att" => "9",
          "tds" => "0",
          "fum" => "0"
        }
      ]
    }
  end
end
