defmodule RunLengthEncoder do
  @doc """
  Generates a string where consecutive elements are represented as a data value and count.
  "AABBBCCCC" => "2A3B4C"
  For this example, assume all input are strings, that are all uppercase letters.
  It should also be able to reconstruct the data into its original form.
  "2A3B4C" => "AABBBCCCC"
  """
  @spec encode(String.t()) :: String.t()
  def encode(string) do
    string
    |> String.graphemes()
    |> Enum.reduce([{String.first(string), 0}], fn
      ch, [{ch, i} | rest] -> [{ch, i + 1} | rest]
      ch, acc -> [{ch, 1} | acc]
    end)
    |> Enum.reverse()
    |> Enum.map_join(fn
      {ch, n} when n <= 1 -> ch
      {ch, i} -> "#{i}#{ch}"
    end)
  end

  @spec decode(String.t()) :: String.t()
  def decode(string) do
    string
    |> String.replace(~r/([[:alpha:]\s])/, "\\1;")
    |> String.split(";", trim: true)
    |> Enum.map_join(fn str ->
      case String.split_at(str, -1) do
        {"", ch} -> ch
        {n, ch} -> String.duplicate(ch, String.to_integer(n))
      end
    end)
  end
end
