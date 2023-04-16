defmodule SpectraWeb.PlayerLive.Index do
  use SpectraWeb, :live_view

  alias Spectra.Hosts
  alias Spectra.Hosts.Player

  @impl true
  def mount(_params, _session, socket) do
    {:ok, stream(socket, :players, Hosts.list_players())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Player")
    |> assign(:player, Hosts.get_player!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Player")
    |> assign(:player, %Player{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Players")
    |> assign(:player, nil)
  end

  @impl true
  def handle_info({SpectraWeb.PlayerLive.FormComponent, {:saved, player}}, socket) do
    {:noreply, stream_insert(socket, :players, player)}
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    player = Hosts.get_player!(id)
    {:ok, _} = Hosts.delete_player(player)

    {:noreply, stream_delete(socket, :players, player)}
  end
end
