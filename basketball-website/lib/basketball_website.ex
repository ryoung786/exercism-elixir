defmodule BasketballWebsite do
  def extract_from_path(data, path) do
    path
    |> String.split(".")
    |> Enum.reduce_while(data, fn key, data ->
      case data[key] do
        nil -> {:halt, nil}
        val -> {:cont, val}
      end
    end)
  end

  def get_in_path(data, path) do
    keys = String.split(path, ".")
    get_in(data, keys)
  end
end
