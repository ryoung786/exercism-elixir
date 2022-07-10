defmodule House do
  @verses [
    {"house", "Jack built"},
    {"malt", "lay in"},
    {"rat", "ate"},
    {"cat", "killed"},
    {"dog", "worried"},
    {"cow with the crumpled horn", "tossed"},
    {"maiden all forlorn", "milked"},
    {"man all tattered and torn", "kissed"},
    {"priest all shaven and shorn", "married"},
    {"rooster that crowed in the morn", "woke"},
    {"farmer sowing his corn", "kept"},
    {"horse and the hound and the horn", "belonged to"}
  ]

  @doc """
  Return verses of the nursery rhyme 'This is the House that Jack Built'.
  """
  @spec recite(start :: integer, stop :: integer) :: String.t()
  def recite(start, stop) do
    start..stop
    |> Enum.map_join(&verse/1)
  end

  defp verse(n) do
    the_result =
      @verses
      |> Enum.slice(0..(n - 1))
      |> Enum.map(fn {noun, verb} -> "the #{noun} that #{verb}" end)
      |> Enum.reverse()
      |> Enum.join(" ")

    "This is #{the_result}.\n"
  end
end
