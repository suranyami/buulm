defmodule BuulmSite.Storybook.BuulmComponents.Button do
  use PhoenixStorybook.Story, :component

  def function, do: &BuulmSiteWeb.Components.Button.button/1

  def variations do
    [
      %Variation{
        id: :default,
        slots: [
          "Button"
        ]
      },
      %Variation{
        id: :outlined,
        attributes: %{
          variant: "outlined"
        },
        slots: [
          "Outlined button"
        ]
      },
    ]
  end
end
