defmodule SpectraWeb.PlayLive do
  use SpectraWeb, :live_view

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, value: 0)}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <div>
      <.header>
        <h1>is a hot-dog a sandwich?</h1>
        <:subtitle>example prompt</:subtitle>
        <div>
          <input
            phx-hook="slider"
            type="range"
            id="slider"
            name="slider"
            min="0"
            max="100"
            value={@value}
            step="10"
          />
          <pre>
        <%= inspect(@value, pretty: true) %>
        </pre>
        </div>
      </.header>
    </div>
    """
  end

  @impl true
  def handle_event("update-slider", %{"value" => value}, socket) do
    {:noreply, assign(socket, value: String.to_integer(value))}
  end
end
