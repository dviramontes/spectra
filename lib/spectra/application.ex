defmodule Spectra.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      SpectraWeb.Telemetry,
      # Start the Ecto repository
      Spectra.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: Spectra.PubSub},
      # Start Finch
      {Finch, name: Spectra.Finch},
      # Start the Endpoint (http/https)
      SpectraWeb.Endpoint
      # Start a worker by calling: Spectra.Worker.start_link(arg)
      # {Spectra.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Spectra.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    SpectraWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
