# Stats

To start the Stats server:

- Install dependencies with `mix deps.get`
- Create and migrate your database with `mix ecto.setup`
- Start Phoenix endpoint with `mix phx.server`

The API is accessible via `http://localhost:4000/api`

# Considerations/Decisions

1. The position is part of the stat and not the player. This allows a player to have stats in multiple positions.
   EG: Receiving stats as a Tight End and Wide Receiver.
2. Uses the player_id from the provided stats as the foreign key for the various stats to link back to the player.
   This was to avoid having to to translate back and forth between the provided ids and internal ones.

# Write up
