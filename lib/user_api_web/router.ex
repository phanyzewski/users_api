defmodule UserApiWeb.Router do
  use UserApiWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", UserApiWeb do
    pipe_through :api
    resources "/users", UserController, except: [:new, :edit]
  end
end
