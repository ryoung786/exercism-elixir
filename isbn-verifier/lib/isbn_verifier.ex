defmodule IsbnVerifier do
  @doc """
    Checks if a string is a valid ISBN-10 identifier

    ## Examples

      iex> IsbnVerifier.isbn?("3-598-21507-X")
      true

      iex> IsbnVerifier.isbn?("3-598-2K507-0")
      false

  """
  @spec isbn?(String.t()) :: boolean
  def isbn?(isbn) do
    only_valid_chars?(isbn) and exactly_nine_digits_plus_check?(isbn) and mod_zero?(isbn)
  end

  defp only_valid_chars?(isbn), do: String.match?(isbn, ~r/^[0-9X\-]*$/)

  defp exactly_nine_digits_plus_check?(isbn) do
    isbn
    |> String.replace(~r/[^0-9X]/, "")
    |> String.match?(~r/^[0-9]{9}[0-9X]$/)
  end

  defp mod_zero?(isbn) do
    0 ==
      isbn
      |> String.replace(~r/[^0-9X]/, "")
      |> String.split("", trim: true)
      |> Enum.map(fn d -> String.replace(d, "X", "10") |> String.to_integer() end)
      |> Enum.zip(10..1)
      |> Enum.map(fn {digit, i} -> digit * i end)
      |> Enum.sum()
      |> rem(11)
  end
end
