defmodule UserApiWeb.Router do
  use UserApiWeb, :router

  pipeline :api do
    plug(:accepts, ["json"])
    plug(:fetch_session)
  end

  pipeline :api_auth do
    plug(:ensure_authentication)
  end

  scope "/api", UserApiWeb do
    pipe_through(:api)
    post("/users/sign_in", UserController, :sign_in)
  end

  scope "/api", UserApiWeb do
    pipe_through([:api, :api_auth])
    resources("/users", UserController, except: [:new, :edit])
  end

  defp ensure_authentication(conn, _opts) do
    current_user_id = get_session(conn, :current_user_id)

    if current_user_id do
      conn
    else
      conn
      |> put_status(:unauthorized)
      |> render(UserApiWeb.ErrorView, "401.json", message: "Unauthenticated user")
      |> halt()
    end
  end
end
