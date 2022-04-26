defmodule PigLatin do
  @vowels 'aeiouAEIOU'

  @doc """
  Given a `phrase`, translate it a word at a time to Pig Latin.
  """
  @spec translate(phrase :: String.t()) :: String.t()
  def translate(phrase) do
    phrase
    |> String.split(" ")
    |> Enum.map(&translate_single_phrase/1)
    |> Enum.join(" ")
  end

  defp translate_single_phrase(phrase) do
    case to_charlist(phrase) do
      [h | rest] when h in @vowels -> [h | rest] ++ 'ay'
      [?q, ?u | rest] -> rest ++ 'quay'
      [xy, b | rest] when xy in 'xy' and b not in @vowels -> [xy, b | rest] ++ 'ay'
      [s, ?q, ?u | rest] when s not in @vowels -> rest ++ [s] ++ 'quay'
      _ -> Regex.replace(~r/^([^aeiou]+)([aeiouy].*)/, phrase, "\\2\\1ay")
    end
    |> to_string()
  end
end
