defmodule Elastique.Articles do
  alias Elastique.Article
  alias Elastique.Repo

  def get_articles() do
    Article
    |> Repo.all
  end
end
