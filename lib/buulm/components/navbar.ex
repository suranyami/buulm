defmodule Buulm.Components.Navbar do
  use Phoenix.Component

  @doc """
  Renders a navbar.

  ## Examples


      <.navbar>
        <.navbar_start>
          <.navbar_item>
          </.navbar_item
        </navbar_start>
        <.navbar_end>
        </.navbar_end>
      </.navbar>

  """
  attr(:start_items, :any, default: [], doc: "Navbar items starting on the left")
  attr(:end_items, :any, default: [], doc: "Navbar items at the right end")

  attr(:current_user, :any, default: nil, doc: "The current user")
  # Rest
  attr(:rest, :global, include: ~w(disabled))

  def navbar(assigns) do
    ~H"""
    <nav class="navbar is-primary" role="navigation" aria-label="main navigation">
      {render_slot(@inner_block)}
    </nav>
    """
  end

  def navbar_divider(assigns) do
    ~H"""
    <hr class="navbar-divider" />
    """
  end

  attr(:title, :string, required: true)

  def navbar_dropdown(assigns) do
    ~H"""
    <div class="navbar-item has-dropdown is-hoverable">
      <a class="navbar-link">
        {@title}
      </a>

      <div class="navbar-dropdown">
        {render_slot(@inner_block)}
      </div>
    </div>
    """
  end

  def navbar_item(assigns) do
    ~H"""
    <a class="navbar-item">
      {render_slot(@inner_block)}
    </a>
    """
  end

  def navbar_menu(assigns) do
    ~H"""
    <div id="navbar-exp" class="navbar-menu">
      {render_slot(@inner_block)}
    </div>
    """
  end

  def navbar_start(assigns) do
    ~H"""
    <div class="navbar-start">
      {render_slot(@inner_block)}
    </div>
    """
  end

  def navbar_end(assigns) do
    ~H"""
    <div class="navbar-end">
      {render_slot(@inner_block)}
    </div>
    """
  end

  def navbar_burger(assigns) do
    ~H"""
    <a
      role="button"
      class="navbar-burger"
      aria-label="menu"
      aria-expanded="false"
      data-target="navbar-exp"
    >
      <span aria-hidden="true"></span>
      <span aria-hidden="true"></span>
      <span aria-hidden="true"></span>
    </a>
    """
  end

  def navbar_link(assigns) do
    ~H"""
    <a class="navbar-link">
      {render_slot(@inner_block)}
    </a>
    """
  end

  attr(:current_user, :any, default: nil)

  def login_buttons(assigns) do
    ~H"""
    <div class="buttons">
      <%= if @current_user do %>
        {@current_user.email}
        <.link href="/users/settings" class="button">Settings </.link>
        <.link href="/users/log_out" method="delete" class="button">Log out</.link>
      <% else %>
        <.link href="/users/register" class="button is-link"> Register </.link>
        <.link href="/users/log_in" class="button is-light">Log in</.link>
      <% end %>
    </div>
    """
  end
end
