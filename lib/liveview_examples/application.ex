defmodule LiveviewExamples.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      LiveviewExamplesWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: LiveviewExamples.PubSub},
      # Start the Endpoint (http/https)
      LiveviewExamplesWeb.Endpoint
      # Start a worker by calling: LiveviewExamples.Worker.start_link(arg)
      # {LiveviewExamples.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: LiveviewExamples.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    LiveviewExamplesWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
