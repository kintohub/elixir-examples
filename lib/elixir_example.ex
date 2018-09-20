defmodule ElixirExample do
  use Application
  require Logger

  def start(_type, _args) do
    # Application.get_env gets :cowboy_port from config/config.exs,
    # from application environment rather than system environment.
    # Get from system environment in config.exs if so desired
    port = Application.get_env(:elixir_example, :cowboy_port, 80)

    children = [
     {Plug.Adapters.Cowboy2, scheme: :http, plug: ElixirExample.Router, options: [port: port]}
    ]

    Logger.info("Application Running on Port #{port}")

    Supervisor.start_link(children, strategy: :one_for_one)
  end

  @moduledoc """
  Documentation for ElixirExample.
  """

  @doc """
  Hello world.

  ## Examples

      iex> ElixirExample.hello()
      :world

  """
  def hello do
    :world
  end


end
