defmodule BuulmSiteWeb.Components.Avatar do
  use Phoenix.Component

  @moduledoc """
  Avatar component using https://avatars.dicebear.com styles.

  Can be overridden by an image URL.

  Styles available:
    adventurer
    adventurer-neutral
    avataaars
    avataaars-neutral
    big-ears
    big-ears-neutral
    big-smile
    bottts
    bottts-neutral
    croodles
    croodles-neutral
    fun-emoji
    icons
    identicon
    initials
    lorelei
    lorelei-neutral
    micah
    miniavs
    notionists
    notionists-neutral
    open-peeps
    personas
    pixel-art
    pixel-art-neutral
    rings
    shapes
    thumbs
  """

  attr(:name, :string, required: true, doc: "Name for avatar and seed for dicebear API")
  attr(:style, :string, default: "miniavs", doc: "Style for dicebear API")
  attr(:img_src, :string, required: false, doc: "Image URL - overrides dicebear API")
  attr(:rounded, :boolean, default: true, doc: "rounded or square")
  attr(:class, :string, default: "", doc: "CSS class for parent div")

  attr(:size, :integer,
    values: [16, 24, 32, 48, 64, 96, 128],
    default: 32,
    doc: "Specify the size of the avatar in pixels x pixels."
  )

  attr(:rest, :global)

  def avatar(assigns) do
    rounded_class = if assigns[:rounded], do: "is-rounded", else: ""
    size = "is-#{assigns[:size]}x#{assigns[:size]}"

    assigns =
      assigns
      |> assign(:rounded, rounded_class)
      |> assign(:figure_classes, ["image", rounded_class, size, assigns[:class]])

    ~H"""
    <figure class={@figure_classes} {@rest}>
      <img
        src={@img_src || "https://api.dicebear.com/8.x/#{@style}/svg?seed=#{@name}"}
        alt={"#{@name} avatar"}
      />
    </figure>
    """
  end
end
