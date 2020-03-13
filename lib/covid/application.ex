defmodule Covid.Application do
  use Application

  def start(_type, _args) do
    children = [
      CovidWeb.Endpoint,
      Covid.Database.Server,
      Covid.CacheSupervisor
    ]

    opts = [strategy: :one_for_one, name: Covid.Supervisor]
    Supervisor.start_link(children, opts)
  end

  def config_change(changed, _new, removed) do
    CovidWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
