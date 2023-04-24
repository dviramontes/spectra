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
            phx-hook="Slider"
            phx-change="increment"
            phx-target={@myself}
            type="range"
            id="slider"
            name="slider"
            min="0"
            max="100"
            value="10"
            step="10"
          />

        </div>
      </.header>
    </div>
    """
  end

  @impl true
  def handle_event("increment", %{"value" => value}, socket) do
    IO.inspect(value, label: "params")
    {:noreply, socket}
  end
end
