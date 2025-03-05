defmodule Elastique.Repo.Migrations.CreateArticles do
  use Ecto.Migration

  def change do
    create table(:articles) do
      add :text, :string
      add :author, :string
      add :label, :string
      add :status, :string
      add :tags, {:array, :string}
      add :published_at, :utc_datetime

      timestamps(type: :utc_datetime)
    end
  end
end
