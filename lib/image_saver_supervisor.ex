defmodule ImageSaver.Supervisor do
  use Supervisor

  def start_link(init_arg) do
    Supervisor.start_link(__MODULE__, init_arg, name: __MODULE__)
  end

  def init(_arg) do
    children = [
      %{id: ImageFinder.Saver, start: {ImageFinder.Saver, :start_link, [Saver1]}, restart: :transient},
    ]

    Supervisor.init(children, strategy: :one_for_one, max_restarts: 5, max_seconds: 5)
  end
end
