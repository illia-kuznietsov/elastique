defmodule Elastique.Article do
  use Ecto.Schema
  import Ecto.Changeset

  schema "articles" do
    field :label, :string
    field :status, Ecto.Enum, values: [:PUBLISHED, :UNPUBLISHED]
    field :author, :string
    field :text, :string
    field :tags, {:array, :string}
    field :published_at, :utc_datetime

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(article, attrs) do
    article
    |> cast(attrs, [:text, :author, :label, :status, :tags, :published_at])
    |> validate_required([:text, :author, :label, :status, :tags, :published_at])
  end
end
