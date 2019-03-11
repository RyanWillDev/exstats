defmodule Stats.Football.Player do
  @moduledoc """
  Schema for storing and validating Football Players.
  """
  use Ecto.Schema
  import Ecto.Changeset
  alias Stats.Football.{Kicking, Passing, Receiving, Rushing}

  schema "football_players" do
    field :name, :string
    field :player_id, :string
    has_many(:kicking_stats, Kicking)
    has_many(:passing_stats, Passing)
    has_many(:receiving_stats, Receiving)
    has_many(:rushing_stats, Rushing)

    timestamps()
  end

  @doc false
  def changeset(player, attrs) do
    player
    |> cast(attrs, [:name, :player_id])
    |> validate_required([:name, :player_id])
  end
end
