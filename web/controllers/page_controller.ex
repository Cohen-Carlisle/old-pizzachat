defmodule Pizzachat.PageController do
  use Pizzachat.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
