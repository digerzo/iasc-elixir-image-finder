defmodule ImageFinder.Worker do
  use GenServer

  def start_link(name) do
    GenServer.start_link(__MODULE__, :ok, name: name)
  end

  def init(:ok) do
    {:ok, %{}}
  end

  def handle_cast({:fetch, source_file, target_directory}, _from, state) do
    content = File.read! source_file
    links = ImageFinder.Fetcher.extract_links(content)
    ImageFinder.Saver.fetch_and_save_links(links, target_directory)
    {:noreply, :ok, state}
  end

end
