defmodule Bob do
  @spec hey(String.t()) :: String.t()
  def hey(input) do
    input
    |> String.trim()
    |> respond()
  end

  defp respond(str) do
    cond do
      yelling?(str) and question?(str) -> "Calm down, I know what I'm doing!"
      question?(str) -> "Sure."
      yelling?(str) -> "Whoa, chill out!"
      str == "" -> "Fine. Be that way!"
      true -> "Whatever."
    end
  end

  defp question?(str), do: String.ends_with?(str, "?")

  defp yelling?(str) do
    String.match?(str, ~r/[[:alpha:]]/) and String.upcase(str) == str
  end
end
