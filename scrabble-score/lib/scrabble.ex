defmodule Scrabble do
  @doc """
  Calculate the scrabble score for the word.
  """

  @spec score(String.t()) :: non_neg_integer
  def score(word) do
    word
    |> String.upcase()
    |> String.graphemes()
    |> Enum.map(fn
      ch when ch in ~w(A E I O U L N R S T) -> 1
      ch when ch in ~w(D G) -> 2
      ch when ch in ~w(B C M P) -> 3
      ch when ch in ~w(F H V W Y) -> 4
      ch when ch in ~w(K) -> 5
      ch when ch in ~w(J X) -> 8
      ch when ch in ~w(Q Z) -> 10
      _ -> 0
    end)
    |> Enum.sum()
  end
end
