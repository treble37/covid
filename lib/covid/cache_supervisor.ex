defmodule Covid.CacheSupervisor do
  use Supervisor

  @spec start_link(any()) :: :ignore | {:error, any()} | {:ok, pid()}
  def start_link(_init_args) do
    Supervisor.start_link(__MODULE__, :ok, name: Covid.CacheSupervisor)
  end

  @impl true
  def init(:ok) do
    children = [
      Covid.Predict.Cache
    ]

    Supervisor.init(children, strategy: :one_for_one)
  end
end
