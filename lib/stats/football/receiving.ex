defmodule Stats.Football.Receiving do
  @moduledoc """
  Schema for storing and validating Football Receiving Stats.
  """
  use Ecto.Schema
  import Ecto.Changeset
  alias Stats.Football.Player

  schema "football_receiving_stats" do
    belongs_to :player, Player
    field :entry_id, :string
    field :position, :string
    field :rec, :string
    field :tds, :string
    field :yds, :string

    timestamps()
  end

  @allowed_attrs []
  @required_attrs [
    :entry_id,
    :position,
    :rec,
    :tds,
    :yds
  ]
  @all_attrs @required_attrs ++ @allowed_attrs

  @doc false
  def changeset(receiving, attrs) do
    receiving
    |> cast(attrs, @all_attrs)
    |> cast_assoc(:player)
    |> validate_required(@required_attrs)
  end
end
