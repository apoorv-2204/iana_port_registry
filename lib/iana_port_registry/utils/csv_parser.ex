defmodule IanaPortRegistry.Utils.CSVParser do
  @moduledoc """
  Parses local CSV files
  """

  @static_registry Path.join(["lib", "db", "csv", "1672826429.csv"])
  require Logger

  # https://www.iana.org/assignments/service-names-port-numbers/service-names-port-numbers.csv

  def parse(:latest_local) do
    # File.stream!("data.csv")
    Logger.info("Parsing CSV#{inspect(File.cwd())}")
    file = Path.join([File.cwd() |> elem(1), @static_registry])
    Logger.info("Parsing CSV#{inspect(file)}")

    file
    |> File.stream!()
    |> CSV.decode(escape_max_lines: 1000, headers: true)
    # |> Enum.map(& &1)
    # |> IO.inspect()
    |> Enum.reduce([], fn
      {:ok, %{"Port Number" => ""}}, acc ->
        acc

      {:ok, %{"Port Number" => port, "Description" => "Unassigned"}}, acc ->
        port_ports =
          port
          |> String.split("-")
          |> Enum.map(&String.to_integer/1)

        # IO.inspect(port_ports)

        case length(port_ports) do
          1 ->
            [port_ports |> List.first() | acc]

          2 ->
            [x, y] = port_ports
            # IO.inspect({x, y, "ports"})

            Enum.reduce(x..y, acc, fn port, acc ->
              # IO.inspect(port)
              [port | acc]
            end)
        end

      {:ok, %{"Port Number" => _}}, acc ->
        acc
    end)
    |> Enum.sort()
    |> Enum.uniq()
    # |> range()
    # |> File.write!(file = Path.join([File.cwd() |> elem(1), @static_registry]))
    |> IO.inspect(limit: :infinity)
  end

  def get_with_range() do
    parse(:latest_local)
    |> range()
    |> Enum.map(fn
      {x, nil} ->
        "#{x}"

      {x, y} ->
        "#{x}-#{y}"
    end)
  end

  def range(list) do
    Enum.reduce(list, [], fn
      z, [] ->
        [{z, nil}]

      z, [{x, nil} | rest] when x + 1 == z ->
        [{x, z} | rest]

      z, [{x, y} | rest] when y + 1 == z ->
        [{x, z} | rest]

      z, [{x, y} | rest] when y + 1 != z ->
        [{z, nil} | [{x, y} | rest]]
    end)
  end
end
