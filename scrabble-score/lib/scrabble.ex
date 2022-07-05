defmodule Scrabble do
  @doc """
  Calculate the scrabble score for the word.
  """

  @letters1 ~w(A E I O U L N R S T)
  @letters2 ~w(D G)
  @letters3 ~w(B C M P)
  @letters4 ~w(F H V W Y)
  @letters5 ~w(K)
  @letters8 ~w(J X)
  @letters10 ~w(Q Z)

  @spec score(String.t()) :: non_neg_integer
  def score(word) do
    word
    |> String.upcase()
    |> String.graphemes()
    |> Enum.frequencies()
    |> Enum.map(fn
      {ch, n} when ch in @letters1 -> n
      {ch, n} when ch in @letters2 -> 2 * n
      {ch, n} when ch in @letters3 -> 3 * n
      {ch, n} when ch in @letters4 -> 4 * n
      {ch, n} when ch in @letters5 -> 5 * n
      {ch, n} when ch in @letters8 -> 8 * n
      {ch, n} when ch in @letters10 -> 10 * n
      _ -> 0
    end)
    |> Enum.sum()
  end
end
