defmodule Stats.Football.Passing do
  @moduledoc """
  Schema for storing and validating Football Passing Stats.
  """
  use Ecto.Schema
  import Ecto.Changeset
  alias Stats.Football.Player

  schema "football_passing_stats" do
    belongs_to :player, Player, references: :player_id, type: :string
    field :att, :string
    field :cmp, :string
    field :entry_id, :string
    field :int, :string
    field :position, :string
    field :tds, :string
    field :yds, :string

    timestamps()
  end

  @allowed_attrs []
  @required_attrs [
    :att,
    :cmp,
    :entry_id,
    :int,
    :player_id,
    :position,
    :tds,
    :yds
  ]
  @all_attrs @required_attrs ++ @allowed_attrs

  @doc false
  def changeset(passing, attrs) do
    passing
    |> cast(attrs, @all_attrs)
    |> cast_assoc(:player)
    |> validate_required(@required_attrs)
  end
end
