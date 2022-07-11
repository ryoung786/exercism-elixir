defmodule MatchingBrackets do
  @open ["(", "{", "["]
  @close [")", "}", "]"]

  @doc """
  Checks that all the brackets and braces in the string are matched correctly, and nested correctly
  """
  @spec check_brackets(String.t()) :: boolean
  def check_brackets(str), do: foo([], String.graphemes(str))

  defp foo([] = _seen, [] = _remaining), do: true
  defp foo(_seen, [] = _remaining), do: false
  defp foo(["[" | rest], ["]" | remaining]), do: foo(rest, remaining)
  defp foo(["(" | rest], [")" | remaining]), do: foo(rest, remaining)
  defp foo(["{" | rest], ["}" | remaining]), do: foo(rest, remaining)
  defp foo(_seen, [wrong_closing | _]) when wrong_closing in @close, do: false
  defp foo(seen, [ch | remaining]) when ch in @open, do: foo([ch | seen], remaining)
  defp foo(seen, [_ | remaining]), do: foo(seen, remaining)
end
