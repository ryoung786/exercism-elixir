defmodule Bob do
  @spec hey(String.t()) :: String.t()
  def hey(input) do
    input = String.trim(input)

    cond do
      yelling?(input) and question?(input) -> "Calm down, I know what I'm doing!"
      question?(input) -> "Sure."
      yelling?(input) -> "Whoa, chill out!"
      blank?(input) -> "Fine. Be that way!"
      true -> "Whatever."
    end
  end

  defp question?(str), do: String.ends_with?(str, "?")

  defp blank?(str), do: str == ""

  defp yelling?(str) do
    # has at least 1 letter, and the whole string is uppercase
    String.match?(str, ~r/[[:alpha:]]/) and String.upcase(str) == str
  end
end
