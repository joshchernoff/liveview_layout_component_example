defmodule LiveviewExamplesWeb.LayoutComponent do
  @moduledoc """
  Component for rendering content inside layout without full DOM patch.
  """
  use LiveviewExamplesWeb, :live_component

  def update_things(%{things: things}) do
    send_update(__MODULE__, id: "layout_comp", things: things)
  end

  def update(assigns, socket) do
    {:ok, assign(socket, things: assigns[:things])}
  end

  def render(assigns) do
    ~H"""
    <div class="mt-8">
      <p>State of my Layoutcomponent.</p>
      <ul>
      <%= for thing <- @things do %>
        <li><%= thing %></li>
      <% end %>
      </ul>
    </div>
    """
  end
end
