defmodule Pizzachat.TopicChannel do
  use Phoenix.Channel
  alias Pizzachat.{Message, Repo}

  def join("topic:pizza", _message, socket) do
    {:ok, "pizza success!", socket}
  end
  def join("topic:" <> _private_room_id, _params, _socket) do
    {:error, %{reason: "pizza failure!"}}
  end

  def handle_in("msg", payload, socket) do
    msg = %Message{}
          |> Message.changeset(payload)
          |> Repo.insert!()
    broadcast!(socket, "msg", Map.take(msg, [:author, :content]))
    {:noreply, socket}
  end
end
