defmodule Spectra.Games.Process do
  @behaviour :gen_statem

  def start_link do
    :gen_statem.start_link(__MODULE__, :ok, [])
  end

  @impl true
  def init(opts) do
    {:ok, :idle, opts}
  end

  @impl true
  def callback_mode, do: :handle_event_function

  @impl true
  def handle_event({:call, from}, :start, :idle, data) do
    {:next_state, :started, data, [{:reply, from, {:ok, :started}}]}
  end
end
