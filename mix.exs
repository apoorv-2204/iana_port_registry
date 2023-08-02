defmodule IanaPortRegistry.MixProject do
  use Mix.Project

  def project do
    [
      name: "iana_port_registry",
      licenses: "SPDX",
      app: :iana_port_registry,
      version: "0.1.0",
      elixir: "~> 1.14",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      description: "Lists unassigned port numbers (0-65535) from IANA",
      package: package(),
      source_url: "https://github.com/apoorv-2204/iana_port_registry"
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    []
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:csv, "~> 3.0"}
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
    ]
  end

  defp package() do
    [
      # This option is only needed when you don't want to use the OTP application name
      name: "iana_port_registry",
      # These are the default files included in the package
      files: ~w(lib .formatter.exs mix.exs README*  LICENSE*),
      licenses: ["Apache-2.0"],
      links: %{"GitHub" => "https://github.com/apoorv-2204/iana_port_registry"}
    ]
  end
end
