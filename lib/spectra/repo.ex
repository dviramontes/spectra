defmodule Spectra.Repo do
  use Ecto.Repo,
    otp_app: :spectra,
    adapter: Ecto.Adapters.Postgres
end
