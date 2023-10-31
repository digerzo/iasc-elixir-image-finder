defmodule ImageFinder.Saver do
  use GenServer

  def start_link(name) do
    GenServer.start_link(__MODULE__, :ok, name: name)
  end

  def init(:ok) do
    {:ok, %{}}
  end

  def fetch_and_save_links(links, target_directory) do
    Enum.each(links, fn link ->
      fetch_and_save_link(link, target_directory)
    end)
  end

  # "ir descargando links a medida que se leen del archivo"
  def fetch_and_save_link(link, target_directory) do
    {:ok, response} = ImageFinder.Fetcher.fetch(link)
    body = response.body
    save(body, target_directory)
  end

  def save(body, directory) do
    File.write! "#{directory}/#{digest(body)}", body
  end

  def digest(body) do
    :crypto.hash(:md5, body) |> Base.encode16()
  end

end
