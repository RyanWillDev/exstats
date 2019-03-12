defmodule Stats.FootballTest do
  use Stats.DataCase

  alias Stats.Football

  describe "football_players" do
    alias Stats.Football.Player

    @valid_attrs %{name: "some name", player_id: "some player_id"}
    @update_attrs %{name: "some updated name", player_id: "some updated player_id"}
    @invalid_attrs %{name: nil, player_id: nil}

    def player_fixture(attrs \\ %{}) do
      {:ok, player} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Football.create_player()

      player
    end

    test "list_football_players/0 returns all football_players" do
      player = player_fixture()
      assert Football.list_football_players() == [player]
    end

    test "get_player!/1 returns the player with given id" do
      player = player_fixture()
      assert Football.get_player!(player.id) == player
    end

    test "create_player/1 with valid data creates a player" do
      assert {:ok, %Player{} = player} = Football.create_player(@valid_attrs)
      assert player.name == "some name"
      assert player.player_id == "some player_id"
    end

    test "create_player/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Football.create_player(@invalid_attrs)
    end

    test "update_player/2 with valid data updates the player" do
      player = player_fixture()
      assert {:ok, %Player{} = player} = Football.update_player(player, @update_attrs)
      assert player.name == "some updated name"
      assert player.player_id == "some updated player_id"
    end

    test "update_player/2 with invalid data returns error changeset" do
      player = player_fixture()
      assert {:error, %Ecto.Changeset{}} = Football.update_player(player, @invalid_attrs)
      assert player == Football.get_player!(player.id)
    end

    test "delete_player/1 deletes the player" do
      player = player_fixture()
      assert {:ok, %Player{}} = Football.delete_player(player)
      assert_raise Ecto.NoResultsError, fn -> Football.get_player!(player.id) end
    end

    test "change_player/1 returns a player changeset" do
      player = player_fixture()
      assert %Ecto.Changeset{} = Football.change_player(player)
    end
  end

  describe "football_rushing_stats" do
    setup _ do
      %Stats.Football.Player{} = player_fixture()
      :ok
    end

    alias Stats.Football.Rushing

    @valid_attrs %{
      player_id: "some player_id",
      att: "42",
      entry_id: "some entry_id",
      fum: "42",
      position: "some position",
      tds: "42",
      yds: "42"
    }
    @update_attrs %{
      att: "43",
      entry_id: "some updated entry_id",
      fum: "43",
      position: "some updated position",
      tds: "43",
      yds: "43"
    }
    @invalid_attrs %{att: nil, entry_id: nil, fum: nil, position: nil, tds: nil, yds: nil}

    def rushing_fixture(attrs \\ %{}) do
      {:ok, rushing} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Football.create_rushing()

      rushing
    end

    test "list_football_rushing_stats/0 returns all football_rushing_stats" do
      rushing = rushing_fixture()
      assert Football.list_football_rushing_stats() == [rushing]
    end

    test "get_rushing!/1 returns the rushing with given id" do
      rushing = rushing_fixture()
      assert Football.get_rushing!(rushing.id) == rushing
    end

    test "create_rushing/1 with valid data creates a rushing" do
      assert {:ok, %Rushing{} = rushing} = Football.create_rushing(@valid_attrs)
      assert rushing.att == "42"
      assert rushing.entry_id == "some entry_id"
      assert rushing.fum == "42"
      assert rushing.position == "some position"
      assert rushing.tds == "42"
      assert rushing.yds == "42"
    end

    test "create_rushing/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Football.create_rushing(@invalid_attrs)
    end

    test "update_rushing/2 with valid data updates the rushing" do
      rushing = rushing_fixture()
      assert {:ok, %Rushing{} = rushing} = Football.update_rushing(rushing, @update_attrs)
      assert rushing.att == "43"
      assert rushing.entry_id == "some updated entry_id"
      assert rushing.fum == "43"
      assert rushing.position == "some updated position"
      assert rushing.tds == "43"
      assert rushing.yds == "43"
    end

    test "update_rushing/2 with invalid data returns error changeset" do
      rushing = rushing_fixture()
      assert {:error, %Ecto.Changeset{}} = Football.update_rushing(rushing, @invalid_attrs)
      assert rushing == Football.get_rushing!(rushing.id)
    end

    test "delete_rushing/1 deletes the rushing" do
      rushing = rushing_fixture()
      assert {:ok, %Rushing{}} = Football.delete_rushing(rushing)
      assert_raise Ecto.NoResultsError, fn -> Football.get_rushing!(rushing.id) end
    end

    test "change_rushing/1 returns a rushing changeset" do
      rushing = rushing_fixture()
      assert %Ecto.Changeset{} = Football.change_rushing(rushing)
    end
  end

  describe "football_passing_stats" do
    alias Stats.Football.Passing

    setup _ do
      %Stats.Football.Player{} = player_fixture()
      :ok
    end

    @valid_attrs %{
      att: "42",
      player_id: "some player_id",
      cmp: "42",
      entry_id: "some entry_id",
      int: "42",
      position: "some position",
      tds: "42",
      yds: "42"
    }
    @update_attrs %{
      att: "43",
      cmp: "43",
      entry_id: "some updated entry_id",
      int: "43",
      position: "some updated position",
      tds: "43",
      yds: "43"
    }
    @invalid_attrs %{cmp: nil, entry_id: nil, int: nil, position: nil, tds: nil, yds: nil}

    def passing_fixture(attrs \\ %{}) do
      {:ok, passing} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Football.create_passing()

      passing
    end

    test "list_football_passing_stats/0 returns all football_passing_stats" do
      passing = passing_fixture()
      assert Football.list_football_passing_stats() == [passing]
    end

    test "get_passing!/1 returns the passing with given id" do
      passing = passing_fixture()
      assert Football.get_passing!(passing.id) == passing
    end

    test "create_passing/1 with valid data creates a passing" do
      assert {:ok, %Passing{} = passing} = Football.create_passing(@valid_attrs)
      assert passing.cmp == "42"
      assert passing.entry_id == "some entry_id"
      assert passing.int == "42"
      assert passing.position == "some position"
      assert passing.tds == "42"
      assert passing.yds == "42"
    end

    test "create_passing/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Football.create_passing(@invalid_attrs)
    end

    test "update_passing/2 with valid data updates the passing" do
      passing = passing_fixture()
      assert {:ok, %Passing{} = passing} = Football.update_passing(passing, @update_attrs)
      assert passing.cmp == "43"
      assert passing.entry_id == "some updated entry_id"
      assert passing.int == "43"
      assert passing.position == "some updated position"
      assert passing.tds == "43"
      assert passing.yds == "43"
    end

    test "update_passing/2 with invalid data returns error changeset" do
      passing = passing_fixture()
      assert {:error, %Ecto.Changeset{}} = Football.update_passing(passing, @invalid_attrs)
      assert passing == Football.get_passing!(passing.id)
    end

    test "delete_passing/1 deletes the passing" do
      passing = passing_fixture()
      assert {:ok, %Passing{}} = Football.delete_passing(passing)
      assert_raise Ecto.NoResultsError, fn -> Football.get_passing!(passing.id) end
    end

    test "change_passing/1 returns a passing changeset" do
      passing = passing_fixture()
      assert %Ecto.Changeset{} = Football.change_passing(passing)
    end
  end

  describe "football_receiving_stats" do
    alias Stats.Football.Receiving

    setup _ do
      %Stats.Football.Player{} = player_fixture()
      :ok
    end

    @valid_attrs %{
      player_id: "some player_id",
      entry_id: "some entry_id",
      position: "some position",
      rec: "42",
      tds: "42",
      yds: "42"
    }
    @update_attrs %{
      entry_id: "some updated entry_id",
      position: "some updated position",
      rec: "43",
      tds: "43",
      yds: "43"
    }
    @invalid_attrs %{entry_id: nil, position: nil, rec: nil, tds: nil, yds: nil}

    def receiving_fixture(attrs \\ %{}) do
      {:ok, receiving} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Football.create_receiving()

      receiving
    end

    test "list_football_receiving_stats/0 returns all football_receiving_stats" do
      receiving = receiving_fixture()
      assert Football.list_football_receiving_stats() == [receiving]
    end

    test "get_receiving!/1 returns the receiving with given id" do
      receiving = receiving_fixture()
      assert Football.get_receiving!(receiving.id) == receiving
    end

    test "create_receiving/1 with valid data creates a receiving" do
      assert {:ok, %Receiving{} = receiving} = Football.create_receiving(@valid_attrs)
      assert receiving.entry_id == "some entry_id"
      assert receiving.position == "some position"
      assert receiving.rec == "42"
      assert receiving.tds == "42"
      assert receiving.yds == "42"
    end

    test "create_receiving/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Football.create_receiving(@invalid_attrs)
    end

    test "update_receiving/2 with valid data updates the receiving" do
      receiving = receiving_fixture()
      assert {:ok, %Receiving{} = receiving} = Football.update_receiving(receiving, @update_attrs)
      assert receiving.entry_id == "some updated entry_id"
      assert receiving.position == "some updated position"
      assert receiving.rec == "43"
      assert receiving.tds == "43"
      assert receiving.yds == "43"
    end

    test "update_receiving/2 with invalid data returns error changeset" do
      receiving = receiving_fixture()
      assert {:error, %Ecto.Changeset{}} = Football.update_receiving(receiving, @invalid_attrs)
      assert receiving == Football.get_receiving!(receiving.id)
    end

    test "delete_receiving/1 deletes the receiving" do
      receiving = receiving_fixture()
      assert {:ok, %Receiving{}} = Football.delete_receiving(receiving)
      assert_raise Ecto.NoResultsError, fn -> Football.get_receiving!(receiving.id) end
    end

    test "change_receiving/1 returns a receiving changeset" do
      receiving = receiving_fixture()
      assert %Ecto.Changeset{} = Football.change_receiving(receiving)
    end
  end

  describe "football_kicking_stats" do
    alias Stats.Football.Kicking

    setup _ do
      %Stats.Football.Player{} = player_fixture()
      :ok
    end

    @valid_attrs %{
      player_id: "some player_id",
      entry_id: "some entry_id",
      extra_pt_att: "42",
      extra_pt_made: "42",
      fld_goals_att: "42",
      fld_goals_made: "42",
      position: "some position"
    }
    @update_attrs %{
      entry_id: "some updated entry_id",
      extra_pt_att: "43",
      extra_pt_made: "43",
      fld_goals_att: "43",
      fld_goals_made: "43",
      position: "some updated position"
    }
    @invalid_attrs %{
      entry_id: nil,
      extra_pt_att: nil,
      extra_pt_made: nil,
      fld_goals_att: nil,
      fld_goals_made: nil,
      position: nil
    }

    def kicking_fixture(attrs \\ %{}) do
      {:ok, kicking} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Football.create_kicking()

      kicking
    end

    test "list_football_kicking_stats/0 returns all football_kicking_stats" do
      kicking = kicking_fixture()
      assert Football.list_football_kicking_stats() == [kicking]
    end

    test "get_kicking!/1 returns the kicking with given id" do
      kicking = kicking_fixture()
      assert Football.get_kicking!(kicking.id) == kicking
    end

    test "create_kicking/1 with valid data creates a kicking" do
      assert {:ok, %Kicking{} = kicking} = Football.create_kicking(@valid_attrs)
      assert kicking.entry_id == "some entry_id"
      assert kicking.extra_pt_att == "42"
      assert kicking.extra_pt_made == "42"
      assert kicking.fld_goals_att == "42"
      assert kicking.fld_goals_made == "42"
      assert kicking.position == "some position"
    end

    test "create_kicking/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Football.create_kicking(@invalid_attrs)
    end

    test "update_kicking/2 with valid data updates the kicking" do
      kicking = kicking_fixture()
      assert {:ok, %Kicking{} = kicking} = Football.update_kicking(kicking, @update_attrs)
      assert kicking.entry_id == "some updated entry_id"
      assert kicking.extra_pt_att == "43"
      assert kicking.extra_pt_made == "43"
      assert kicking.fld_goals_att == "43"
      assert kicking.fld_goals_made == "43"
      assert kicking.position == "some updated position"
    end

    test "update_kicking/2 with invalid data returns error changeset" do
      kicking = kicking_fixture()
      assert {:error, %Ecto.Changeset{}} = Football.update_kicking(kicking, @invalid_attrs)
      assert kicking == Football.get_kicking!(kicking.id)
    end

    test "delete_kicking/1 deletes the kicking" do
      kicking = kicking_fixture()
      assert {:ok, %Kicking{}} = Football.delete_kicking(kicking)
      assert_raise Ecto.NoResultsError, fn -> Football.get_kicking!(kicking.id) end
    end

    test "change_kicking/1 returns a kicking changeset" do
      kicking = kicking_fixture()
      assert %Ecto.Changeset{} = Football.change_kicking(kicking)
    end
  end
end
