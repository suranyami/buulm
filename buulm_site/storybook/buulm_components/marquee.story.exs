defmodule BuulmSite.Storybook.BuulmComponents.Marquee do
  use PhoenixStorybook.Story, :component

  def function, do: &BuulmSiteWeb.Components.Marquee.marquee/1
  def imports, do: [{BuulmSiteWeb.Components.Card, [card: 1]}]

  def variations do
    [
      %Variation{
        id: :marquee,
        attributes: %{
          pause_on_hover: true,
          repeat: 4,
          reverse: false,
          vertical: false
        },
        slots: ["<.card image=\"https://picsum.photos/64\" title=\"Rhiannon\" subheading=\"@rhiality\" body=\"Just run mix buulm.install card\" />"]
      },
      %Variation{
        id: :reverse_marquee,
        attributes: %{
          pause_on_hover: true,
          repeat: 4,
          reverse: true,
          vertical: false
        },
        slots: ["<.card image=\"https://picsum.photos/64\" title=\"Rhiannon\" subheading=\"@rhiality\" body=\"Just run mix buulm.install card\" />"]
      },
      %Variation{
        id: :vertical_marquee,
        attributes: %{
          pause_on_hover: true,
          repeat: 4,
          reverse: false,
          vertical: true
        },
        slots: ["<.card image=\"https://picsum.photos/64\" title=\"Rhiannon\" subheading=\"@rhiality\" body=\"Just run mix buulm.install card\" />"]
      },
      %Variation{
        id: :reverse_vertical_marquee,
        attributes: %{
          pause_on_hover: true,
          repeat: 3,
          reverse: true,
          vertical: true
        },
        slots: ["<.card image=\"https://picsum.photos/64\" title=\"Rhiannon\" subheading=\"@rhiality\" body=\"Just run mix buulm.install card\" />"]
      }
    ]
  end
end
