defmodule Buulm.CoreComponents.Modal do
  use Phoenix.Component
  use Gettext, backend: Buulm.Gettext

  import Buulm.CoreComponents.JsCommands
  alias Phoenix.LiveView.JS

  attr(:id, :string, required: true)
  attr(:show, :boolean, default: false)
  attr(:on_cancel, JS, default: %JS{})
  slot(:inner_block, required: true)

  @doc """
  Renders a modal.

  ## Examples

      <.modal id="confirm-modal">
        This is a modal.
      </.modal>

  JS commands may be passed to the `:on_cancel` to configure
  the closing/cancel event, for example:

      <.modal id="confirm" on_cancel={JS.navigate(~p"/posts")}>
        This is another modal.
      </.modal>

  """
  def modal(assigns) do
    ~H"""
    <dialog
      id={@id}
      class="modal"
      phx-mounted={@show && show_modal(@id)}
      phx-remove={hide(@id)}
      data-cancel={JS.exec(@on_cancel, "phx-remove")}
    >
      <.focus_wrap>
        <div
          class="modal-content"
          id={"#{@id}-content"}
          aria-labelledby={"#{@id}-title"}
          aria-describedby={"#{@id}-description"}
          role="dialog"
          aria-modal="true"
          tabindex="0"
        >
          {render_slot(@inner_block, hide(@id))}
        </div>
      </.focus_wrap>
      <button
        class="modal-close is-large"
        phx-click={JS.exec("data-cancel", to: "##{@id}")}
        aria-label="close"
        type="button"
        aria-label="close"
      >
      </button>
    </dialog>
    """
  end

  def show(id) do
    JS.dispatch("show-dialog-modal", to: "##{id}")
  end

  def hide(id) do
    JS.dispatch("hide-dialog-modal", to: "##{id}")
  end
end
