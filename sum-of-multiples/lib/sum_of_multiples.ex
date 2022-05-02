defmodule SumOfMultiples do
  @doc """
  Adds up all numbers from 1 to a given end number that are multiples of the factors provided.
  """
  @spec to(non_neg_integer, [non_neg_integer]) :: non_neg_integer
  def to(limit, factors) do
    factors
    |> Enum.flat_map(&multiples(&1, limit))
    |> Enum.uniq()
    |> Enum.sum()
  end

  defp multiples(0, _), do: [0]

  defp multiples(n, limit) do
    n
    |> Stream.iterate(fn a -> a + n end)
    |> Enum.take_while(fn a -> a < limit end)
  end
end
