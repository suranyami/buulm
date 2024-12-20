defmodule Buulm.CoreComponents.Button do
  @moduledoc """
  Button component.
  """
  use Phoenix.Component
  alias Buulm.CoreComponents.Colors

  def imports, do: [{Buulm.CoreComponents.Icon, [icon: 1]}]

  @doc """
  Renders a button element.

  ## Examples

  Button styles:

      <.button>Default</.button>
      <.button outlined>Outlined</.button>
      <.button inverted>Inverted</.button>
      <.button inverted outlined>Invert Outlined</.button>
      <.button rounded>Rounded</.button>

  Button colors:

      <.button color={:primary}>Primary</.button>
      <.button color={:link}>Link</.button>
      <.button color={:info}>Info</.button>
      <.button color={:success}>Success</.button>
      <.button color={:warning}>Warning</.button>
      <.button color={:danger}>Danger</.button>
      <.button color={:danger} light=true >Light Color Variant</.button>

  Button sizes:

      <.button size={:small}>Small</.button>
      <.button size={:normal}>Normal</.button>
      <.button size={:medium}>Medium</.button>
      <.button size={:large}>Large</.button>

  Button states:

      <.button size={:hovered}>Hovered</.button>
      <.button size={:focused}>Focused</.button>
      <.button size={:active}>Active</.button>
      <.button size={:loading}>Loading</.button>
      <.button size={:disabled}>Disabled</.button>

  """
  # Styles
  attr(:outlined, :boolean, default: false, doc: "Outlined style")
  attr(:inverted, :boolean, default: false, doc: "Inverted style")
  attr(:rounded, :boolean, default: false, doc: "Rounded corners")

  # Sizes
  attr(:size, :atom, default: nil, values: [nil, :small, :normal, :medium, :large])
  attr(:responsive, :boolean, default: false, doc: "Different sizes for each breakpoint")

  # Colors
  attr(:color, :atom, default: nil, values: [nil | Colors.colors()])
  attr(:light, :boolean, default: false, doc: "Light color variant")

  # States
  attr(:hovered, :boolean, default: false)
  attr(:focused, :boolean, default: false)
  attr(:active, :boolean, default: false)
  attr(:loading, :boolean, default: false)
  attr(:disabled, :boolean, default: false)

  # Rest
  attr(:class, :string, default: nil)
  attr(:type, :string, default: nil)
  attr(:rest, :global, include: ~w(disabled form name value))

  slot(:inner_block, required: true)

  @is_key_attrs [
    :outlined,
    :inverted,
    :rounded,
    :light,
    :hovered,
    :focused,
    :active,
    :loading,
    :disabled
  ]

  @is_value_attrs [
    :color,
    :size
  ]
  def button(assigns) do
    class_names =
      for attr <- @is_key_attrs, reduce: ["button"] do
        names -> put_is_key(names, attr, assigns)
      end

    class_names =
      for attr <- @is_value_attrs, reduce: class_names do
        names -> put_is_value(names, attr, assigns)
      end

    assigns = assign(assigns, :class, [assigns[:class] | Enum.reverse(class_names)])

    ~H"""
    <button type={@type} class={@class} {@rest}><%= render_slot(@inner_block) %></button>
    """
  end

  defp put_is_key(class_names, key, assigns) do
    if assigns[key] do
      put_is_class(class_names, key)
    else
      class_names
    end
  end

  defp put_is_value(class_names, key, assigns) do
    if value = assigns[key] do
      ["is-#{value}" | class_names]
    else
      class_names
    end
  end

  defp put_is_class(class_names, name) do
    ["is-#{name}" | class_names]
  end
end
