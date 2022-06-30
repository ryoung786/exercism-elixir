defmodule ResistorColorDuo do
  @resistors ~w(black brown red orange yellow green blue violet grey white)a

  @doc """
  Calculate a resistance value from two colors
  """
  @spec value(colors :: [atom]) :: integer
  def value(colors) do
    colors
    |> Enum.take(2)
    |> Enum.map(fn color -> Enum.find_index(@resistors, &(&1 == color)) end)
    |> Integer.undigits()
  end
end
