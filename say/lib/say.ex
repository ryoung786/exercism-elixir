defmodule Say do
  @doc """
  Translate a positive integer into English.
  """
  @spec in_english(integer) :: {atom, String.t()}
  def in_english(n) when n < 0 or n > 999_999_999_999, do: {:error, "number is out of range"}
  def in_english(n), do: {:ok, say(n)}

  defp say(0), do: "zero"
  defp say(1), do: "one"
  defp say(2), do: "two"
  defp say(3), do: "three"
  defp say(4), do: "four"
  defp say(5), do: "five"
  defp say(6), do: "six"
  defp say(7), do: "seven"
  defp say(8), do: "eight"
  defp say(9), do: "nine"
  defp say(10), do: "ten"
  defp say(11), do: "eleven"
  defp say(12), do: "twelve"
  defp say(13), do: "thirteen"
  defp say(14), do: "fourteen"
  defp say(15), do: "fifteen"
  defp say(16), do: "sixteen"
  defp say(17), do: "seventeen"
  defp say(18), do: "eighteen"
  defp say(19), do: "nineteen"

  defp say(n) when n in 20..99 do
    singles = rem(n, 10)
    tens = n |> rem(100) |> div(10)

    if singles == 0,
      do: say_tens(tens),
      else: "#{say_tens(tens)}-#{say(singles)}"
  end

  defp say(n) when n in 100..999 do
    case rem(n, 100) do
      0 -> "#{say(div(n, 100))} hundred"
      m -> "#{say(div(n, 100))} hundred #{say(m)}"
    end
  end

  defp say(n) when n in 0..999_999_999_999_999 do
    n
    |> Integer.digits()
    |> Enum.reverse()
    |> Enum.chunk_every(3)
    |> Enum.map(fn digits -> digits |> Enum.reverse() |> Integer.undigits() end)
    |> Enum.zip(["", "thousand", "million", "billion", "trillion"])
    |> Enum.reject(fn {n, _scale} -> n == 0 end)
    |> Enum.reverse()
    |> Enum.map_join(" ", &say_chunk/1)
  end

  defp say_chunk({n, ""}), do: say(n)
  defp say_chunk({n, scale}), do: "#{say(n)} #{scale}"

  defp say_tens(2), do: "twenty"
  defp say_tens(3), do: "thirty"
  defp say_tens(4), do: "forty"
  defp say_tens(5), do: "fifty"
  defp say_tens(6), do: "sixty"
  defp say_tens(7), do: "seventy"
  defp say_tens(8), do: "eighty"
  defp say_tens(9), do: "ninety"
end
