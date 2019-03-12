defmodule StatsWeb.UploadControllerTest do
  use StatsWeb.ConnCase

  @stats_data %{
    kicking: [
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
    passing: [
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
    receiving: [
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
    rushing: [
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

  describe "upload" do
    test "valid stats data will retrun 201", %{conn: conn} do
      conn = post(conn, Routes.upload_path(conn, :upload), %{"stats" => @stats_data})
      assert response(conn, 204)
    end
  end
end
