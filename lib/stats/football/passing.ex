defmodule Stats.Football.Passing do
  @moduledoc """
  Schema for storing and validating Football Passing Stats.
  """
  use Ecto.Schema
  import Ecto.Changeset
  alias Stats.Football.Player

  schema "football_passing_stats" do
    belongs_to :player, Player
    field :cmp, :integer
    field :entry_id, :string
    field :int, :integer
    field :position, :string
    field :tds, :integer
    field :yds, :integer

    timestamps()
  end

  @allowed_attrs []
  @required_attrs [
    :cmp,
    :entry_id,
    :int,
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
