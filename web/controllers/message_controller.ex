defmodule Pizzachat.MessageController do
  alias Pizzachat.{Message, Repo}
  use Pizzachat.Web, :controller

  def index(conn, _params) do
    messages = Repo.all(Message)
    render conn, "index.html", messages: messages
  end

  def create(conn, params) do
    changeset = Pizzachat.Message.changeset(%Message{}, params)
    case Repo.insert(changeset) do
    {:ok, _message} ->
      conn
      |> send_resp(201, "Pizza success!")
    {:error, changeset} ->
      conn
      |> send_resp(500, "Pizza failure!")
    end
  end
end
