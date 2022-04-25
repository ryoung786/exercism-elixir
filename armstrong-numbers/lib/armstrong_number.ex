defmodule ArmstrongNumber do
  @moduledoc """
  Provides a way to validate whether or not a number is an Armstrong number
  """

  @spec valid?(integer) :: boolean
  def valid?(number) do
    digits = Integer.digits(number)
    num_digits = Enum.count(digits)

    number ==
      digits
      |> Enum.map(fn digit -> :math.pow(digit, num_digits) end)
      |> Enum.sum()
  end
end
