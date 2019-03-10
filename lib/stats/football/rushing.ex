defmodule Stats.Football.Rushing do
  @moduledoc """
  Schema for storing and validating Football Rushing Stats.
  """
  use Ecto.Schema
  import Ecto.Changeset
  alias Stats.Football.Player

  schema "football_rushing_stats" do
    field :att, :integer
    field :entry_id, :string
    field :fum, :integer
    field :position, :string
    field :tds, :integer
    field :yds, :integer
    belongs_to :player, Player

    timestamps()
  end

  @allowed_attrs []
  @required_attrs [
    :att,
    :entry_id,
    :fum,
    :position,
    :tds,
    :yds
  ]
  @all_attrs @required_attrs ++ @allowed_attrs

  @doc false
  def changeset(rushing, attrs) do
    rushing
    |> cast(attrs, @all_attrs)
    |> cast_assoc(:player)
    |> validate_required(@required_attrs)
  end
end
