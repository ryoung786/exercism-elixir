defmodule Isogram do
  @doc """
  Determines if a word or sentence is an isogram
  """
  @spec isogram?(String.t()) :: boolean
  def isogram?(sentence) do
    sentence
    |> String.downcase()
    |> String.replace(~r/[^[:alpha:]]/, "")
    |> String.graphemes()
    |> Enum.frequencies()
    |> Map.values()
    |> Enum.all?(&(&1 == 1))
  end
end
