defmodule Stats.Football do
  @moduledoc """
  The Football context.
  """

  import Ecto.Query, warn: false
  alias Stats.Repo

  alias Stats.Football.{Kicking, Passing, Player, Receiving, Rushing}

  def stats_by_players(player_ids) when is_list(player_ids) do
    [kicking, passing, receiving, rushing] =
      [Kicking, Passing, Receiving, Rushing]
      |> Enum.map(fn schema ->
        schema
        |> where([s], s.player_id in ^player_ids)
        |> preload(:player)
      end)
      |> Enum.map(&Repo.all/1)

    %{kicking: kicking, passing: passing, receiving: receiving, rushing: rushing}
  end

  @doc """
  Returns the list of football_players.

  ## Examples

      iex> list_football_players()
      [%Player{}, ...]

  """
  def list_football_players do
    Repo.all(Player)
  end

  @doc """
  Gets a single player.

  Raises `Ecto.NoResultsError` if the Player does not exist.

  ## Examples

      iex> get_player!(123)
      %Player{}

      iex> get_player!(456)
      ** (Ecto.NoResultsError)

  """
  def get_player!(id), do: Repo.get!(Player, id)

  @doc """
  Creates a player.

  ## Examples

      iex> create_player(%{field: value})
      {:ok, %Player{}}

      iex> create_player(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_player(attrs \\ %{}) do
    %Player{}
    |> Player.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a player.

  ## Examples

      iex> update_player(player, %{field: new_value})
      {:ok, %Player{}}

      iex> update_player(player, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_player(%Player{} = player, attrs) do
    player
    |> Player.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Player.

  ## Examples

      iex> delete_player(player)
      {:ok, %Player{}}

      iex> delete_player(player)
      {:error, %Ecto.Changeset{}}

  """
  def delete_player(%Player{} = player) do
    Repo.delete(player)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking player changes.

  ## Examples

      iex> change_player(player)
      %Ecto.Changeset{source: %Player{}}

  """
  def change_player(%Player{} = player) do
    Player.changeset(player, %{})
  end

  alias Stats.Football.Rushing

  @doc """
  Returns the list of football_rushing_stats.

  ## Examples

      iex> list_football_rushing_stats()
      [%Rushing{}, ...]

  """
  def list_football_rushing_stats do
    Repo.all(Rushing)
  end

  @doc """
  Gets a single rushing.

  Raises `Ecto.NoResultsError` if the Rushing does not exist.

  ## Examples

      iex> get_rushing!(123)
      %Rushing{}

      iex> get_rushing!(456)
      ** (Ecto.NoResultsError)

  """
  def get_rushing!(id), do: Repo.get!(Rushing, id)

  @doc """
  Creates a rushing.

  ## Examples

      iex> create_rushing(%{field: value})
      {:ok, %Rushing{}}

      iex> create_rushing(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_rushing(attrs \\ %{}) do
    %Rushing{}
    |> Rushing.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a rushing.

  ## Examples

      iex> update_rushing(rushing, %{field: new_value})
      {:ok, %Rushing{}}

      iex> update_rushing(rushing, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_rushing(%Rushing{} = rushing, attrs) do
    rushing
    |> Rushing.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Rushing.

  ## Examples

      iex> delete_rushing(rushing)
      {:ok, %Rushing{}}

      iex> delete_rushing(rushing)
      {:error, %Ecto.Changeset{}}

  """
  def delete_rushing(%Rushing{} = rushing) do
    Repo.delete(rushing)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking rushing changes.

  ## Examples

      iex> change_rushing(rushing)
      %Ecto.Changeset{source: %Rushing{}}

  """
  def change_rushing(%Rushing{} = rushing) do
    Rushing.changeset(rushing, %{})
  end

  alias Stats.Football.Passing

  @doc """
  Returns the list of football_passing_stats.

  ## Examples

      iex> list_football_passing_stats()
      [%Passing{}, ...]

  """
  def list_football_passing_stats do
    Repo.all(Passing)
  end

  @doc """
  Gets a single passing.

  Raises `Ecto.NoResultsError` if the Passing does not exist.

  ## Examples

      iex> get_passing!(123)
      %Passing{}

      iex> get_passing!(456)
      ** (Ecto.NoResultsError)

  """
  def get_passing!(id), do: Repo.get!(Passing, id)

  @doc """
  Creates a passing.

  ## Examples

      iex> create_passing(%{field: value})
      {:ok, %Passing{}}

      iex> create_passing(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_passing(attrs \\ %{}) do
    %Passing{}
    |> Passing.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a passing.

  ## Examples

      iex> update_passing(passing, %{field: new_value})
      {:ok, %Passing{}}

      iex> update_passing(passing, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_passing(%Passing{} = passing, attrs) do
    passing
    |> Passing.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Passing.

  ## Examples

      iex> delete_passing(passing)
      {:ok, %Passing{}}

      iex> delete_passing(passing)
      {:error, %Ecto.Changeset{}}

  """
  def delete_passing(%Passing{} = passing) do
    Repo.delete(passing)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking passing changes.

  ## Examples

      iex> change_passing(passing)
      %Ecto.Changeset{source: %Passing{}}

  """
  def change_passing(%Passing{} = passing) do
    Passing.changeset(passing, %{})
  end

  alias Stats.Football.Receiving

  @doc """
  Returns the list of football_receiving_stats.

  ## Examples

      iex> list_football_receiving_stats()
      [%Receiving{}, ...]

  """
  def list_football_receiving_stats do
    Repo.all(Receiving)
  end

  @doc """
  Gets a single receiving.

  Raises `Ecto.NoResultsError` if the Receiving does not exist.

  ## Examples

      iex> get_receiving!(123)
      %Receiving{}

      iex> get_receiving!(456)
      ** (Ecto.NoResultsError)

  """
  def get_receiving!(id), do: Repo.get!(Receiving, id)

  @doc """
  Creates a receiving.

  ## Examples

      iex> create_receiving(%{field: value})
      {:ok, %Receiving{}}

      iex> create_receiving(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_receiving(attrs \\ %{}) do
    %Receiving{}
    |> Receiving.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a receiving.

  ## Examples

      iex> update_receiving(receiving, %{field: new_value})
      {:ok, %Receiving{}}

      iex> update_receiving(receiving, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_receiving(%Receiving{} = receiving, attrs) do
    receiving
    |> Receiving.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Receiving.

  ## Examples

      iex> delete_receiving(receiving)
      {:ok, %Receiving{}}

      iex> delete_receiving(receiving)
      {:error, %Ecto.Changeset{}}

  """
  def delete_receiving(%Receiving{} = receiving) do
    Repo.delete(receiving)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking receiving changes.

  ## Examples

      iex> change_receiving(receiving)
      %Ecto.Changeset{source: %Receiving{}}

  """
  def change_receiving(%Receiving{} = receiving) do
    Receiving.changeset(receiving, %{})
  end

  alias Stats.Football.Kicking

  @doc """
  Returns the list of football_kicking_stats.

  ## Examples

      iex> list_football_kicking_stats()
      [%Kicking{}, ...]

  """
  def list_football_kicking_stats do
    Repo.all(Kicking)
  end

  @doc """
  Gets a single kicking.

  Raises `Ecto.NoResultsError` if the Kicking does not exist.

  ## Examples

      iex> get_kicking!(123)
      %Kicking{}

      iex> get_kicking!(456)
      ** (Ecto.NoResultsError)

  """
  def get_kicking!(id), do: Repo.get!(Kicking, id)

  @doc """
  Creates a kicking.

  ## Examples

      iex> create_kicking(%{field: value})
      {:ok, %Kicking{}}

      iex> create_kicking(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_kicking(attrs \\ %{}) do
    %Kicking{}
    |> Kicking.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a kicking.

  ## Examples

      iex> update_kicking(kicking, %{field: new_value})
      {:ok, %Kicking{}}

      iex> update_kicking(kicking, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_kicking(%Kicking{} = kicking, attrs) do
    kicking
    |> Kicking.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Kicking.

  ## Examples

      iex> delete_kicking(kicking)
      {:ok, %Kicking{}}

      iex> delete_kicking(kicking)
      {:error, %Ecto.Changeset{}}

  """
  def delete_kicking(%Kicking{} = kicking) do
    Repo.delete(kicking)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking kicking changes.

  ## Examples

      iex> change_kicking(kicking)
      %Ecto.Changeset{source: %Kicking{}}

  """
  def change_kicking(%Kicking{} = kicking) do
    Kicking.changeset(kicking, %{})
  end
end
