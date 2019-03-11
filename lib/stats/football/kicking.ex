defmodule Stats.Football.Kicking do
  @moduledoc """
  Schema for storing and validating Football Kicking Stats.
  """
  use Ecto.Schema
  import Ecto.Changeset

  alias Stats.Football.Player

  schema "football_kicking_stats" do
    belongs_to :player, Player, references: :player_id, type: :string
    field :entry_id, :string
    field :extra_pt_att, :string
    field :extra_pt_made, :string
    field :fld_goals_att, :string
    field :fld_goals_made, :string
    field :position, :string

    timestamps()
  end

  @allowed_attrs []
  @required_attrs [
    :entry_id,
    :extra_pt_att,
    :extra_pt_made,
    :fld_goals_att,
    :fld_goals_made,
    :position
  ]
  @all_attrs @allowed_attrs ++ @required_attrs

  @doc false
  def changeset(kicking, attrs) do
    kicking
    |> cast(attrs, @all_attrs)
    |> cast_assoc(:player)
    |> validate_required(@required_attrs)
  end
end
