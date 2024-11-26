defmodule Buulm.MixProject do
  use Mix.Project

  def project do
    [
      app: :buulm,
      version: "0.0.9",
      elixir: "~> 1.16",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      package: package(),
      templates: ~w(priv/templates),
      description: "Extends Phoenix CoreComponents using Bulma instead of Tailind."
    ]
  end

  defp package() do
    [
      name: "buulm",
      files: ~w(lib/tasks priv/templates .formatter.exs mix.exs README* LICENSE*
                CHANGELOG*),
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/suranyami/buulm"}
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:bulma, github: "suranyami/bulma-elixir"},
      {:dart_sass, "~> 0.7", runtime: Mix.env() == :dev},
      {:credo, "~> 1.7", only: [:dev, :test], runtime: false},
      {:ex_doc, ">= 0.0.0", only: :dev, runtime: false},
      {:gettext, "~> 0.26"},
      {:mix_test_watch, "~> 1.2", only: [:dev, :test], runtime: false},
      {:mox, "~> 1.2", only: :test},
      {:phoenix_html, "~> 4.1"},
      {:phoenix_live_view, "~> 1.0.0-rc.7"},
      {:phoenix, "~> 1.7"},
      {:tailwind_formatter, "~> 0.4.0", only: [:dev, :test], runtime: false}
    ]
  end
end
