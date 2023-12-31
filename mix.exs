defmodule ImageFinder.Mixfile do
  use Mix.Project

  def project do
    [app: :image_finder,
     version: "0.0.1",
     elixir: "~> 1.10",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps()]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [applications: [:logger, :tesla],
     mod: {ImageFinder, []}]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps() do
    [
      {:tesla, "~> 1.4"},

      # optional, but recommended adapter
      {:hackney, "~> 1.17"},
  
      # optional, required by JSON middleware
      {:jason, ">= 1.0.0"}
    ]
  end
end
