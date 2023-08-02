defmodule IanaPortRegistry do
  @moduledoc """
  Returns a list of all unassigned ports from the IANA port registry.
  """
  alias IanaPortRegistry.Registry

  @doc """
  Lists all unassigned ports from the IANA port registry.
  """
  def list_unassigned_ports() do
    Registry.read_data()
  end
end
