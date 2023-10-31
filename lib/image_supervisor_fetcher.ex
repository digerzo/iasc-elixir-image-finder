defmodule ImageFetcher.Supervisor do
  use Supervisor

  def start_link(init_arg) do
    Supervisor.start_link(__MODULE__, init_arg, name: __MODULE__)
  end

  def init(_arg) do
    children = [
      %{id: ImageFinder.Fetcher, start: {ImageFinder.Fetcher, :start_link, [Fetcher1]}, restart: :transient},
    ]

    Supervisor.init(children, strategy: :one_for_one, max_restarts: 5, max_seconds: 5)
  end
end
