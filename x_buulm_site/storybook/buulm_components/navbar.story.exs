defmodule BuulmSite.Storybook.BuulmComponents.Navbar do
  use PhoenixStorybook.Story, :component

  def function, do: &Buulm.Components.Navbar.navbar/1
  def imports, do: [
    {Buulm.Components.Navbar, [navbar: 1]},

  ]

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
          <div class="navbar-item"></div>
        </div>
      </div>
