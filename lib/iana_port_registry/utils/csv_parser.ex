defmodule IanaPortRegistry.Utils.CSVParser do
  @moduledoc """
  Parses local CSV files
  """

  @static_registry Path.join(["lib", "db", "csv", "static_registry.csv"])
  require Logger

  def parse() do
    # File.stream!("data.csv")
    Logger.info("Parsing CSV#{inspect(File.cwd())}")
  end
end
