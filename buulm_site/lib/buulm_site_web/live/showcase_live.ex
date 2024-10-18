defmodule BuulmSiteWeb.ShowcaseLive do
  use BuulmSiteWeb, :live_view
  import Phoenix.Component
  import BuulmSiteWeb.CoreComponents
  import Buulm.Components.Hero
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  def render(assigns) do
    ~H"""
      <section>
        <.hero>
          Showcase
          <:subtitle>
            Some Phoenix projects using Buulm components
          </:subtitle>
        </.hero>
      </section>

      <section>
        <div class="max-w-full mx-auto px-4 py-8">
          <div class="grid grid-cols-1 md:grid-cols-3 gap-12">
            <.showcase_entry image_url="/images/showcase/uini.png">
              <:name>Uini</:name>
              <:description>AI-powered user-research tool</:description>
            </.showcase_entry>
            <.showcase_entry image_url="/images/showcase/mealmind.png">
              <:name>mealmind</:name>
              <:description>AI-powered meal planning</:description>
            </.showcase_entry>
          </div>
        </div>
      </section>
    """
  end

  attr(:image_url, :string, required: true)
  slot(:name, required: true)
  slot(:description, required: true)
  defp showcase_entry(assigns) do
    ~H"""
      <div class="relative h-full">
        <a href={@url} target="_blank">
        <img class="rounded-lg object-cover w-full h-full" src={@image_url} />
        <div class="absolute bottom-0 bg-black/50 left-0 p-4 bg-gradient-to-t from-black to-transparent w-full">
          <h3 class="text-xl font-medium text-white">
            <%= render_slot(@name) %>
          </h3>
          <p class="text-neutral-400"><%= render_slot(@description) %></p>
        </div>
        </a>
      </div>
    """
  end
end
