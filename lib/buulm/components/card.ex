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
  slot(:left)
  slot(:center)
  slot(:right)

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
          <div :if={@left != []} class="media-left">
            {render_slot(@left)}
          </div>
          <div :if={@center != []} class="media-content has-text-centered ">
            {render_slot(@center)}
          </div>
          <div :if={@right != []} class="media-right">
            {render_slot(@right)}
          </div>
          {render_slot(@inner_block)}
        </div>
      </div>
    </div>
    """
  end
end
