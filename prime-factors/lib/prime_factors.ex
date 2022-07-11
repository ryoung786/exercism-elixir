defmodule PrimeFactors do
  @doc """
  Compute the prime factors for 'number'.

  The prime factors are prime numbers that when multiplied give the desired
  number.

  The prime factors of 'number' will be ordered lowest to highest.
  """
  @spec factors_for(pos_integer) :: [pos_integer]
  def factors_for(1), do: []

  def factors_for(number) do
    divisors =
      1..(:math.sqrt(number) |> floor())
      |> Stream.filter(fn n -> rem(number, n) == 0 end)
      |> Enum.take(2)

    case divisors do
      [1, a | _] -> [a | factors_for(div(number, a))]
      [1] -> [number]
    end
  end
end
