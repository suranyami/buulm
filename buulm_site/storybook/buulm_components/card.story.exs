defmodule BuulmSite.Storybook.BuulmComponents.Cards do
  use PhoenixStorybook.Story, :component

  # def function, do: &BuulmSiteWeb.Components.Card.card/1
  def function, do: &BuulmSiteWeb.Components.Marquee.marquee/1
  def imports, do: [{BuulmSiteWeb.Components.Card, [card: 1]}]

  def template do
    """
    <.card image="https://picsum.photos/64" title="Title" subheading="@subheading" body="Just run mix buulm.install card" />
    """
  end

  def variations do
    [
      %Variation{
        id: :default,
        attributes: %{
          title: "Title",
          subheading: "Subheading",
          image: "http://hello.x.com",
        },
      }
    ]
  end
end
