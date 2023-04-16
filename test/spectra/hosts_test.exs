defmodule Spectra.HostsTest do
  use Spectra.DataCase

  alias Spectra.Hosts

  describe "players" do
    alias Spectra.Hosts.Player

    import Spectra.HostsFixtures

    @invalid_attrs %{icon: nil, name: nil}

    test "list_players/0 returns all players" do
      player = player_fixture()
      assert Hosts.list_players() == [player]
    end

    test "get_player!/1 returns the player with given id" do
      player = player_fixture()
      assert Hosts.get_player!(player.id) == player
    end

    test "create_player/1 with valid data creates a player" do
      valid_attrs = %{icon: "some icon", name: "some name"}

      assert {:ok, %Player{} = player} = Hosts.create_player(valid_attrs)
      assert player.icon == "some icon"
      assert player.name == "some name"
    end

    test "create_player/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Hosts.create_player(@invalid_attrs)
    end

    test "update_player/2 with valid data updates the player" do
      player = player_fixture()
      update_attrs = %{icon: "some updated icon", name: "some updated name"}

      assert {:ok, %Player{} = player} = Hosts.update_player(player, update_attrs)
      assert player.icon == "some updated icon"
      assert player.name == "some updated name"
    end

    test "update_player/2 with invalid data returns error changeset" do
      player = player_fixture()
      assert {:error, %Ecto.Changeset{}} = Hosts.update_player(player, @invalid_attrs)
      assert player == Hosts.get_player!(player.id)
    end

    test "delete_player/1 deletes the player" do
      player = player_fixture()
      assert {:ok, %Player{}} = Hosts.delete_player(player)
      assert_raise Ecto.NoResultsError, fn -> Hosts.get_player!(player.id) end
    end

    test "change_player/1 returns a player changeset" do
      player = player_fixture()
      assert %Ecto.Changeset{} = Hosts.change_player(player)
    end
  end
end
