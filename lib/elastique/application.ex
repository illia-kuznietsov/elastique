defmodule Elastique.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      ElastiqueWeb.Telemetry,
      Elastique.Repo,
      {DNSCluster, query: Application.get_env(:elastique, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: Elastique.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: Elastique.Finch},
      # Start a worker by calling: Elastique.Worker.start_link(arg)
      # {Elastique.Worker, arg},
      # Start to serve requests, typically the last entry
      ElastiqueWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Elastique.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    ElastiqueWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
