# IanaPortRegistry


## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `iana_port_registry` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:iana_port_registry, "~> 0.1.0"}
  ]
end
```
### Usage
```elixir 
  IanaPortRegistry.list_unassigned_ports()

[4, 6, 8, 10, 12, 14, 15, 16, 26, 28, 30, 32, 34, 36, 40, 60, 81, 100, 258, 272,
 273, 274, 275, 276, 277, 278, 279, 285, 288, 289, 290, 291, 292, 293, 294, 295,
 296, 297, 298, 299, 300, 301, 302, 303, 304, 305, 306, 307, 325, 326, ...]
```


