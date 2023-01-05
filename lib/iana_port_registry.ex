defmodule IanaPortRegistry do
  @moduledoc """
  Documentation for `IanaPortRegistry`.
  """
  alias IanaPortRegistry.Registry

  @doc """
  Lists all unassigned ports from the IANA port registry.
  """
  def list_unassigned_ports() do
    Registry.available_ports()
  end
end
