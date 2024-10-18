defmodule BuulmSite.Storybook.BuulmComponents.CodeSnippet do
  use PhoenixStorybook.Story, :component

  def function, do: &Buulm.Components.CodeSnippet.code_snippet/1

  def variations do
    [
      %Variation{
        id: :default,
        slots: ["Button"]
      },
      %Variation{
        id: :custom_colors,
        attributes: %{
          text_color: "orange-500"
        },
        slots: ["mix phx.server"]
      },
      %Variation{
        id: :custom_delimeter,
        attributes: %{
          delimiter: ">",
          text_color: "emerald-800",
          background_color: "green-200"
        },
        slots: ["mix buulm.install code_snippet"]
      }
    ]
  end
end
