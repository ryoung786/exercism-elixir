defmodule PerfectNumbers do
  @doc """
  Determine the aliquot sum of the given `number`, by summing all the factors
  of `number`, aside from `number` itself.

  Based on this sum, classify the number as:

  :perfect if the aliquot sum is equal to `number`
  :abundant if the aliquot sum is greater than `number`
  :deficient if the aliquot sum is less than `number`
  """
  @spec classify(number :: integer) :: {:ok, atom} | {:error, String.t()}
  def classify(n) when n <= 0,
    do: {:error, "Classification is only possible for natural numbers."}

  def classify(number) do
    case aliquot_sum(number) do
      ^number -> {:ok, :perfect}
      n when n > number -> {:ok, :abundant}
      n when n < number -> {:ok, :deficient}
    end
  end

  defp aliquot_sum(number) do
    1..(:math.sqrt(number) |> floor())
    |> Enum.filter(fn n -> rem(number, n) == 0 end)
    |> Enum.flat_map(&[&1, div(number, &1)])
    |> Enum.uniq()
    |> Enum.reject(&(&1 == number))
    |> Enum.sum()
  end
end
