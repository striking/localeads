defmodule Localeads.Repo do
  use Ecto.Repo,
    otp_app: :localeads,
    adapter: Ecto.Adapters.Postgres
end
