defmodule Buulm.CoreComponents.List do
  use Phoenix.Component

  attr(:style_type, :string,
    default: "disc",
    values: ~w(disc circle square decimal),
    doc: "The list style type"
  )

  attr(:rest, :global)
  slot(:item, required: true)

  @doc """
  Renders an unordered list.

  ## Examples

      <.list>
        <:item>Apple</:item>
        <:item>Banana</:item>
        <:item>Cherry</:item>
      </.list>

  """

  def list(assigns) do
    ~H"""
    <ul class={["list" ++ @style_type]}>
      <%= for item <- @item do %>
        <li>{item}</li>
      <% end %>
    </ul>
    """
  end
end
