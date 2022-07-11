defmodule ResistorColorTrio do
  @resistors ~w(black brown red orange yellow green blue violet grey white)a

  @doc """
  Calculate the resistance value in ohm or kiloohm from resistor colors
  """
  @spec label(colors :: [atom]) :: {number, :ohms | :kiloohms}
  def label(colors) do
    [a, b, c] =
      colors
      |> Enum.take(3)
      |> Enum.map(fn color -> Enum.find_index(@resistors, &(&1 == color)) end)

    (Integer.undigits([a, b]) * Integer.pow(10, c))
    |> unit()
  end

  defp unit(n) when n < 1000, do: {n, :ohms}
  defp unit(n), do: {div(n, 1000), :kiloohms}
end
