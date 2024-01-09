defmodule SurfaceExample.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      SurfaceExampleWeb.Telemetry,
      # Start the Ecto repository
      SurfaceExample.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: SurfaceExample.PubSub},
      # Start Finch
      {Finch, name: SurfaceExample.Finch},
      # Start the Endpoint (http/https)
      SurfaceExampleWeb.Endpoint
      # Start a worker by calling: SurfaceExample.Worker.start_link(arg)
      # {SurfaceExample.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: SurfaceExample.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    SurfaceExampleWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
