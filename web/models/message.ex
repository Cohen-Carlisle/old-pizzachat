defmodule Pizzachat.Message do
  use Pizzachat.Web, :model

  schema "messages" do
    field :author, :string
    field :content, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:author, :content])
    |> validate_required([:content])
    |> validate_length(:author,  max: 50)
    |> validate_length(:content, max: 500)
  end
end
