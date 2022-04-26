defmodule Prime do
  @doc """
  Generates the nth prime.
  """
  @spec nth(non_neg_integer) :: non_neg_integer
  def nth(n) when n > 0 do
    Stream.unfold([2], fn [last_prime | _] = primes ->
      next_prime =
        last_prime..9_999_999_999_999_999_999
        |> Enum.find(&prime?(&1, primes))

      {last_prime, [next_prime | primes]}
    end)
    |> Enum.at(n - 1)
  end

  defp prime?(n, primes) do
    Enum.all?(primes, fn p -> rem(n, p) > 0 end)
  end
end
