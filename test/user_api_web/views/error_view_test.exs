defmodule UserApiWeb.ErrorViewTest do
  use UserApiWeb.ConnCase, async: true

  # Bring render/3 and render_to_string/3 for testing custom views
  import Phoenix.View

  test "renders 404.json" do
    assert render(UserApiWeb.ErrorView, "404.json", []) == %{errors: %{detail: "Endpoint not found!"}}
  end

  test "renders 500.json" do
    assert render(UserApiWeb.ErrorView, "500.json", []) ==
             %{errors: %{detail: "Internal server error"}}
  end
end
