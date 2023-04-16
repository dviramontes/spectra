defmodule Spectra.HostsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Spectra.Hosts` context.
  """

  @doc """
  Generate a player.
  """
  def player_fixture(attrs \\ %{}) do
    {:ok, player} =
      attrs
      |> Enum.into(%{
        icon: "some icon",
        name: "some name"
      })
      |> Spectra.Hosts.create_player()

    player
  end
end
