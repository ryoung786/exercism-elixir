defmodule WordCount do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t()) :: map
  def count(sentence) do
    sentence
    |> String.downcase()
    |> remove_punctuation()
    |> String.split(~r/[\s,_]/, trim: true)
    |> remove_single_quotes()
    |> Enum.frequencies()
  end

  defp remove_punctuation(str), do: String.replace(str, ~r/[^',_\-\w\s]/u, "")
  defp remove_single_quotes(lst), do: Enum.map(lst, &String.trim(&1, "'"))
end
