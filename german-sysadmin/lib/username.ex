defmodule Username do
  def sanitize(username) do
    # ä becomes ae
    # ö becomes oe
    # ü becomes ue
    # ß becomes ss

    # username
    # |> Enum.filter(fn char ->
    #   is_lowercase?(char) or char == ?_
    # end)
    # |> IO.inspect(label: "[xxx] ")
    # |> Enum.flat_map(fn
    #   ?ä -> 'ae'
    #   ?ö -> 'oe'
    #   ?ü -> 'ue'
    #   ?ß -> 'ss'
    #   ch -> [ch]
    # end)

    username
    |> keep_lowercase_latin_and_underscores()
    |> swap_out_german_letters()
  end

  # defp is_lowercase?(char) when char >= 55296, do: false

  defp keep_lowercase_latin_and_underscores(charlist) do
    Enum.filter(charlist, fn char ->
      char in (Enum.to_list(?a..?z) ++ [?_, ?ß, ?ä, ?ö, ?ü])
    end)
  end

  defp swap_out_german_letters(charlist) do
    Enum.flat_map(charlist, fn char ->
      case char do
        ?ä -> 'ae'
        ?ö -> 'oe'
        ?ü -> 'ue'
        ?ß -> 'ss'
        ch -> [ch]
      end
    end)
  end
end
