defmodule Anagram do
  @doc """
  Returns all candidates that are anagrams of, but not equal to, 'base'.
  """
  @spec match(String.t(), [String.t()]) :: [String.t()]
  def match(base, candidates) do
    candidates
    |> Enum.filter(fn str -> char_count(str) == char_count(base) end)
    |> Enum.reject(fn str -> String.downcase(str) == String.downcase(base) end)
  end

  defp char_count(str) do
    str
    |> String.downcase()
    |> String.graphemes()
    |> Enum.frequencies()
  end
end
