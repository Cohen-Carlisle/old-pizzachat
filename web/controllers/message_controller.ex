defmodule Pizzachat.MessageController do
  alias Pizzachat.{Message, Repo}
  use Pizzachat.Web, :controller

  def index(conn, _params) do
    messages = Repo.all(Message)
    changeset = Message.changeset(%Message{})
    render(conn, "index.html", messages: messages, changeset: changeset)
  end

  def create(conn, params) do
    changeset = Pizzachat.Message.changeset(%Message{}, params["message"])
    case Repo.insert(changeset) do
    {:ok, _message} ->
      conn
      |> send_resp(201, "Pizza success!")
    {:error, changeset} ->
      conn
      |> send_resp(500, "Pizza failure!")
    end
  end

  def api_create(conn, params) do
    create(conn, %{"message" => params})
  end
end
