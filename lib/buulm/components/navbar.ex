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
      <div class="navbar-brand">
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
      </div>

      <div id="navbar-exp" class="navbar-menu">
        <div class="navbar-start">
          <a class="navbar-item">
            Home
          </a>

          <a class="navbar-item">
            Documentation
          </a>

          <div class="navbar-item has-dropdown is-hoverable">
            <a class="navbar-link">
              More
            </a>

            <div class="navbar-dropdown">
              <a class="navbar-item">
                About
              </a>
              <a class="navbar-item">
                Jobs
              </a>
              <a class="navbar-item">
                Contact
              </a>
              <hr class="navbar-divider" />
              <a class="navbar-item">
                Report an issue
              </a>
            </div>
          </div>
        </div>

        <div class="navbar-end">
          <div class="navbar-item">
            <div class="buttons">
              <%!-- <%= if @current_user do %>
                <%= @current_user.email %>
                <.link href={"/users/settings"} class="button">
                  Settings
                </.link>
                <.link href={"/users/log_out"} method="delete" class="button">
                  Log out
                </.link>
              <% else %>
                <.link href={~p"/users/register"} class="button is-link">
                  Register
                </.link>
                <.link href={~p"/users/log_in"} class="button is-light">
                  Log in
                </.link>
              <% end %> --%>
            </div>
          </div>
        </div>
      </div>
    </nav>
    """
  end
end
