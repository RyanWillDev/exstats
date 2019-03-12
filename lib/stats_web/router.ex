defmodule StatsWeb.Router do
  use StatsWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", StatsWeb do
    pipe_through :api

    scope "/football" do
      post "/", UploadController, :upload
      get "/", FootballController, :get
      get "/players", FootballController, :list_players
    end
  end
end
