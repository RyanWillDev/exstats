# Stats

To start the Stats server:

- Install dependencies with `mix deps.get`
- Create and migrate your database with `mix ecto.setup`
- Start Phoenix endpoint with `mix phx.server`

The API is accessible via `http://localhost:4000/api`
There is a JSON file `stats_endpoint.json` that can be imported into [Insomnia](https://insomnia.rest/)
to test the endpoints.

# Considerations/Decisions

1. The position is part of the stat and not the player. This allows a player to have stats in multiple positions.
   EG: The same player can have Receiving stats as a Tight End and Wide Receiver.
2. Stats use the player_id from the provided in the uploaded data as the foreign key to link back to the player.
   This was to avoid having to to translate back and forth between the provided ids and internal ones.

# Notes

## Stats

The Stats server's domain logic is broken down into a context per sport the server has data on.
Currently, that is just football, but other sports could be added in the future.

Each context contains the schemas and business logic for storing and retrieving stats of that sport.
Each stat is stored in its own table with a foreign key to find the corresponding player.

## StatsWeb

The Stats server's API consists of endpoints to:

- upload new stats to `POST /football`
- retrieve all players `GET /football/players` in order to get ids to retrieve player stats
- get stats for a set of players by id `GET/football?players=<COMMA-SEPERATED-LIST-OF-PLAYER_IDS>`
- get all stats for a given sport `GET /football`

## UploadParser

This module parses and stores the stats posted to the upload endpoint.
Currently, there is only a parser for football stats, but others can be added as new sports are added to the server's dataset.

# Future Features

There were some features that occurred while working on this feature that could be implemented in the future.

These include:

- Adding stats for additional sports in the future you could add the same set of endpoints under a different scope.
  `/baseball` for example.
- Adding parameters to the stats requests to return data based on other criteria such as season and week of season in addition to
  player ids
  - Example ?week=4&season="NFL_Reg"
  - This could be implemented by storing the additional information as part of the stat and adding the specified criteria to the where
    clause that retrieves the stats from the database
  - Ecto's composable query DSL will provide a way to conditionally build a query based on the provided parameters
- Tracking meta data about the current week and season as stats are uploaded
  - This would provide flexibility in searching for stats
  - You could return the stats only for the most recent upload if no week or season parameters were provided
