defmodule Spectra.GamesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Spectra.Games` context.
  """

  @doc """
  Generate a game.
  """
  def game_fixture(attrs \\ %{}) do
    {:ok, game} =
      attrs
      |> Enum.into(%{
        name: "some name"
      })
      |> Spectra.Games.create_game()

    game
  end
end
