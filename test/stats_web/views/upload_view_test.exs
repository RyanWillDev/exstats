defmodule StatsWeb.UploadViewTest do
  use StatsWeb.ConnCase, async: true

  import Phoenix.View

  test "error.json renders provided message" do
    assert render(StatsWeb.UploadView, "error.json", %{message: "Message to render"}) == %{
             details: %{error: "Message to render"}
           }
  end
end
