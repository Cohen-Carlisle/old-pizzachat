defmodule Pizzachat.Router do
  use Pizzachat.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Pizzachat do
    pipe_through :browser # Use the default browser stack

    get "/", MessageController, :index
    post "/message/create", MessageController, :create
  end

  # Other scopes may use custom stacks.
  scope "/api", Pizzachat do
    pipe_through :api
    post "/message/create", MessageController, :create
  end
end
