defmodule ImageFinder.Supervisor do
  use Supervisor

  def start_link do
    Supervisor.start_link(__MODULE__, :ok, name: __MODULE__)
  end

  def init(:ok) do
    children = [
      %{id: ImageFinder.Worker, start: {ImageFinder.Worker, :start_link, [Worker1]}, restart: :transient},
    ]

    Supervisor.init(children, strategy: :one_for_one, max_restarts: 5, max_seconds: 5)
  end
end
