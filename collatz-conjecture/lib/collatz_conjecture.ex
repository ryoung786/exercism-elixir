defmodule CollatzConjecture do
  @doc """
  calc/1 takes an integer and returns the number of steps required to get the
  number to 1 when following the rules:
    - if number is odd, multiply with 3 and add 1
    - if number is even, divide by 2
  """
  @spec calc(input :: pos_integer()) :: non_neg_integer()
  def calc(input) when is_integer(input) and input > 0 do
    do_calc(input, 0)
  end

  defp do_calc(1, i), do: i
  defp do_calc(n, i) when rem(n, 2) == 1, do: do_calc(n * 3 + 1, i + 1)
  defp do_calc(n, i), do: do_calc(div(n, 2), i + 1)
end
