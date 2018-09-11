defmodule Plugger do
  use Application
  require Logger
  @moduledoc """
  Documentation for Plugger.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Plugger.hello()
      :world

  """
  def start(_type, _args) do
    children = [
      {Plug.Adapters.Cowboy2, scheme: :http, plug: Router, options: [port: 8080]}
    ]

    Logger.info("Started application")

    Supervisor.start_link(children, strategy: :one_for_one)
  end
end
