defmodule StatsWeb.UploadView do
  use StatsWeb, :view

  def render("duplicate_entries.json", _) do
    %{
      details: %{
        error: "Duplicate values were uploaded"
      }
    }
  end

  def render("error.json", %{message: message}) do
    %{
      details: %{
        error: message
      }
    }
  end
end
