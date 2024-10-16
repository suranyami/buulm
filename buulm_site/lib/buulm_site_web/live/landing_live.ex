defmodule BuulmSiteWeb.LandingLive do
  use BuulmSiteWeb, :live_view
  import BuulmSiteWeb.Components.GlowButton
  import BuulmSiteWeb.Components.CodeSnippet
  import BuulmSiteWeb.Components.GradientText
  import BuulmSiteWeb.Components.Hero
  import BuulmSiteWeb.Components.BentoGrid
  import BuulmSiteWeb.Components.Marquee
  import BuulmSiteWeb.Components.Card
  import BuulmSiteWeb.Components.Avatar

  def mount(_params, _session, socket) do
    {:ok, socket}
  end
end
