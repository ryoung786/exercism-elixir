defmodule RomanNumerals do
  @roman_numeral_mapping [
    {1000, "M"},
    {900, "CM"},
    {500, "D"},
    {400, "CD"},
    {100, "C"},
    {90, "XC"},
    {50, "L"},
    {40, "XL"},
    {10, "X"},
    {9, "IX"},
    {5, "V"},
    {4, "IV"},
    {1, "I"}
  ]

  @doc """
  Convert the number to a roman number.
  """
  @spec numeral(pos_integer) :: String.t()
  def numeral(number) do
    h(number, [])
  end

  defp h(0, numerals) do
    numerals
    |> Enum.reverse()
    |> Enum.join()
  end

  defp h(n, numerals) do
    @roman_numeral_mapping
    |> Enum.find(fn {x, _} -> n >= x end)
    |> then(fn {x, numeral} -> h(n - x, [numeral | numerals]) end)
  end
end
