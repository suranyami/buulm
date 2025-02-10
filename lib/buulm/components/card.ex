defmodule Buulm.Components.Card do
  use Phoenix.Component

  @moduledoc """
  Card component.
  """
  use Phoenix.Component

  @doc """
  Renders a card with optional image.
  """
  slot(:inner_block, required: true)
  slot(:figure)

  def card(assigns) do
    ~H"""
    <div class="card">
      <div :if={@figure != []} class="card-image">
        <figure class="image is-4by3">
          {render_slot(@figure)}
        </figure>
      </div>
      <div class="card-content">
        <div class="media">
          <div class="media-content">
            {render_slot(@inner_block)}
          </div>
        </div>
      </div>
    </div>
    """
  end
end
