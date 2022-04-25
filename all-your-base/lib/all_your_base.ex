defmodule AllYourBase do
  @doc """
  Given a number in input base, represented as a sequence of digits, converts it to output base,
  or returns an error tuple if either of the bases are less than 2
  """

  @spec convert(list, integer, integer) :: {:ok, list} | {:error, String.t()}
  def convert(digits, input_base, output_base) do
    with :ok <- validate_input(digits, input_base, output_base) do
      {:ok,
       digits
       |> Integer.undigits(input_base)
       |> Integer.digits(output_base)}
    end
  end

  defp validate_input(digits, input, output) do
    cond do
      output < 2 -> {:error, "output base must be >= 2"}
      input < 2 -> {:error, "input base must be >= 2"}
      invalid_digit?(digits, input) -> {:error, "all digits must be >= 0 and < input base"}
      true -> :ok
    end
  end

  defp invalid_digit?(digits, input_base) do
    not Enum.all?(digits, fn d -> d >= 0 and d < input_base end)
  end
end
