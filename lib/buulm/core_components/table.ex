defmodule Buulm.CoreComponents.Table do
  use Phoenix.Component
  use Gettext, backend: Buulm.Gettext

  attr(:id, :string, required: true)

  attr(:rows, :list, doc: "Data you want to list", required: true)
  attr(:bordered, :boolean, default: false)
  attr(:striped, :boolean, default: false)
  attr(:narrow, :boolean, default: false)
  attr(:hoverable, :boolean, default: false)
  attr(:fullwidth, :boolean, default: false)
  attr(:row_id, :any, default: nil, doc: "the function for generating the row id")
  attr(:row_click, :any, default: nil, doc: "the function for handling phx-click on each row")

  attr(:row_item, :any,
    default: &Function.identity/1,
    doc: "the function for mapping each row before calling the :col and :action slots"
  )

  slot(:action, doc: "the slot for showing user actions in the last table column")

  slot :col, doc: "Describe one of your table columns" do
    attr(:label, :string, doc: "Column label", required: true)
  end

  @doc ~S"""
  Renders a table with generic styling.

  ## Examples

      <.table id="users" rows={@users}>
        <:col :let={user} label="id"><%= user.id %></:col>
        <:col :let={user} label="username"><%= user.username %></:col>
      </.table>
  """

  def table(assigns) do
    assigns =
      with %{rows: %Phoenix.LiveView.LiveStream{}} <- assigns do
        assign(assigns, row_id: assigns.row_id || fn {id, _item} -> id end)
      end

    ~H"""
    <table class={modifier_classes(assigns) ++ ["table"]}>
      <thead>
        <tr>
          <th :for={col <- @col}><%= col[:label] %></th>
          <th :if={@action != []}>
            <span><%= gettext("Actions") %></span>
          </th>
        </tr>
      </thead>
      <tbody id={@id} phx-update={match?(%Phoenix.LiveView.LiveStream{}, @rows) && "stream"}>
        <tr :for={row <- @rows} id={@row_id && @row_id.(row)}>
          <td
            :for={col <- @col}
            phx-click={@row_click && @row_click.(row)}
            class={[@row_click && "hover:cursor-pointer"]}
          >
            <%= render_slot(col, @row_item.(row)) %>
          </td>
          <td :if={@action != []} class="relative w-14 p-0">
            <div class="relative whitespace-nowrap py-4 text-right text-sm font-medium">
              <span class="absolute -inset-y-px -right-4 left-0 group-hover:bg-zinc-50 sm:rounded-r-xl" />
              <span
                :for={action <- @action}
                class="relative ml-4 font-semibold leading-6 text-zinc-900 hover:text-zinc-700"
              >
                <%= render_slot(action, @row_item.(row)) %>
              </span>
            </div>
          </td>
        </tr>
      </tbody>
    </table>
    """
  end

  def modifier_classes(assigns) do
    Enum.filter([:bordered, :striped, :narrow, :hoverable, :fullwidth], fn key -> assigns[key] end)
    |> Enum.map(fn key -> "is-#{key}" end)
  end

  def selected_class(row) do
    if row[:selected], do: "is-selected", else: ""
  end
end
