defmodule StatsWeb.UploadController do
  use StatsWeb, :controller
  alias Stats.UploadParser

  def upload(conn, %{"stats" => stats}) do
    stats = UploadParser.Football.parse(stats)

    case Stats.Football.store_stats(stats) do
      {:ok, _stats} ->
        send_resp(conn, :no_content, "")

      {:error, :unique_violation} ->
        conn
        |> put_status(:bad_request)
        |> render("duplicate_entries.json")

      _ ->
        conn
        |> put_status(:bad_request)
        |> render("error.json",
          message: "An error occurred attempting to store the uploaded stats data"
        )
    end
  end
end
