defmodule ExTiberius.MixProject do
  use Mix.Project

  def project do
    [
      app: :ex_tiberius,
      version: "0.1.0",
      elixir: "~> 1.9",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      description: "Elixir TDS implementation for Microsoft SQL Server",
      package: [
        maintainers: ["Svan Jansson"],
        licenses: ["MIT"],
        links: %{Github: "https://github.com/svan-jansson/ex_tiberius"}
      ],
      compilers: [:rustler] ++ Mix.compilers(),
      rustler_crates: [
        ex_tiberius_nif: [
          path: "native/ex_tiberius_nif",
          mode: if(Mix.env() == :prod, do: :release, else: :debug)
        ]
      ]
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:rustler, "~> 0.21.0"}
    ]
  end
end
