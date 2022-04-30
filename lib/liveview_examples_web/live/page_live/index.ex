defmodule LiveviewExamplesWeb.PageLive.Index do
  use LiveviewExamplesWeb, :live_view

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :things, [])}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <h2>State of my PageLive LV</h2>
    <button phx-click="add_thing">Add thing</button>
    <button phx-click="remove_thing">Remove thing</button>

    <ul>
      <%= for thing <- @things do %>
        <li><%= thing %></li>
      <% end %>
    </ul>
    """
  end

  @impl true
  def handle_event("add_thing", _value, %{assigns: %{things: things}} = socket) do
    new_things = things ++ ["foo"]
    LiveviewExamplesWeb.LayoutComponent.update_things(%{things: new_things})
    {:noreply, assign(socket, :things, new_things)}
  end

  @impl true
  def handle_event("remove_thing", _value, %{assigns: %{things: things}} = socket) do
     [_| new_things] = things
     LiveviewExamplesWeb.LayoutComponent.update_things(%{things: new_things})
    {:noreply, assign(socket, :things, new_things)}
  end
end
