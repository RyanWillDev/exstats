defmodule StatsWeb.Router do
  use StatsWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", StatsWeb do
    pipe_through :api

    scope "/stats" do
      scope "/football" do
        post "/upload", UploadController, :upload
      end
    end
  end
end
