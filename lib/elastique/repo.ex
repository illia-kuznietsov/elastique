defmodule Elastique.Repo do
  use Ecto.Repo,
    otp_app: :elastique,
    adapter: Ecto.Adapters.Postgres
end
