defmodule ImageFinder do
  use Application

  def start(_type, _args) do
    name_application()
    create_mega_supervisor()
  end

  def name_application() do
    Process.register(self(), ImageFinder)
  end

  def create_mega_supervisor() do
    import Supervisor.Spec, warn: false

    children = [
      ImageFinder.Supervisor
    ]

    opts = [strategy: :one_for_one, name: MegaSupervisor, max_seconds: 5, max_restarts: 3]

    Supervisor.start_link(children, opts)
  end
  def fetch(source_file, target_directory) do
    GenServer.call(Worker1, {:fetch, source_file, target_directory})
  end
end

# ImageFinder.fetch("sample2.txt", "./out")
