defmodule ImageFinder.Fetcher do
  use GenServer

  def start_link(name) do
    GenServer.start_link(__MODULE__, :ok, name: name)
  end

  def init(:ok) do
    {:ok, %{}}
  end

  def extract_links(content) do
    regexp = ~r/http(s?)\:.*?\.(png|jpg|gif)/
    Regex.scan(regexp, content)
    |> Enum.map(&List.first/1)
  end

  def fetch(link) do
    Tesla.get(link)
  end

end
