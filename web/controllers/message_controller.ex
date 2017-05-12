defmodule Pizzachat.MessageController do
  alias Pizzachat.{Message, Repo}
  use Pizzachat.Web, :controller

  def index(conn, _params) do
    messages = Repo.all(from m in Message, order_by: [desc: m.inserted_at])
    render(conn, "index.html", messages: messages)
  end
end
