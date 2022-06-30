defmodule RotationalCipher do
  @doc """
  Given a plaintext and amount to shift by, return a rotated string.

  Example:
  iex> RotationalCipher.rotate("Attack at dawn", 13)
  "Nggnpx ng qnja"
  """
  @spec rotate(text :: String.t(), shift :: integer) :: String.t()
  def rotate(text, shift) do
    text
    |> String.to_charlist()
    |> Enum.map(fn
      ch when ch in ?a..?z -> rem(ch + shift - ?a, 26) + ?a
      ch when ch in ?A..?Z -> rem(ch + shift - ?A, 26) + ?A
      ch -> ch
    end)
    |> to_string()
  end
end
