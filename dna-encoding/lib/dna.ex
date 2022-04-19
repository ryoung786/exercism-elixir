defmodule DNA do
  def encode_nucleotide(code_point) do
    case code_point do
      ?A -> 0b0001
      ?C -> 0b0010
      ?G -> 0b0100
      ?T -> 0b1000
      _ -> 0
    end
  end

  def decode_nucleotide(encoded_code) do
    case encoded_code do
      0b0001 -> ?A
      0b0010 -> ?C
      0b0100 -> ?G
      0b1000 -> ?T
      0 -> ?\s
    end
  end

  def encode([]), do: <<>>

  def encode([base | rest]) do
    <<encode_nucleotide(base)::4, encode(rest)::bitstring>>
  end

  def decode(dna), do: do_decode(dna, '')

  defp do_decode(<<>>, acc), do: reverse(acc)

  defp do_decode(<<x::4, rest::bitstring>>, acc) do
    do_decode(rest, [decode_nucleotide(x) | acc])
  end

  defp reverse(lst), do: do_reverse(lst, [])
  defp do_reverse([], acc), do: acc
  defp do_reverse([x | rest], acc), do: do_reverse(rest, [x | acc])
end
