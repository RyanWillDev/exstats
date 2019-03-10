defmodule StatsWeb.Router do
  use StatsWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", StatsWeb do
    pipe_through :api
  end
end
