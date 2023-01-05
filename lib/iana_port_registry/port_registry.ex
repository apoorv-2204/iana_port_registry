defmodule IanaPortRegistry.Registry do
  alias IanaPortRegistry.Utils.CSVParser

  def available_ports() do
    CSVParser.parse(:latest_local)
  end

  def write_to_file() do
    File.write(get_file_path(), :erlang.term_to_binary(available_ports()))
  end

  def get_file_path() do
    Path.join([
      File.cwd() |> elem(1),
      "lib",
      "db",
      "parsed_data",
      "1672826429_IANA_unassigned_ports_elixir_list.txt"
    ])
  end

  def read_data() do
    :erlang.binary_to_term(File.read!(get_file_path()))
  end
end
