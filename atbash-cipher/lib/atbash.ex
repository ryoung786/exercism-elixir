defmodule Atbash do
  @doc """
  Encode a given plaintext to the corresponding ciphertext

  ## Examples

  iex> Atbash.encode("completely insecure")
  "xlnko vgvob rmhvx fiv"
  """
  @spec encode(String.t()) :: String.t()
  def encode(plaintext) do
    plaintext
    |> String.downcase()
    |> strip_non_alphanumeric()
    |> String.to_charlist()
    |> Enum.map(&flip/1)
    |> Enum.chunk_every(5)
    |> Enum.intersperse(' ')
    |> Enum.join()
  end

  @spec decode(String.t()) :: String.t()
  def decode(cipher) do
    cipher
    |> strip_non_alphanumeric()
    |> String.to_charlist()
    |> Enum.map(&flip/1)
    |> to_string()
  end

  defp flip(ch) when ch in ?a..?z, do: ?a + (?z - ch)
  defp flip(ch) when ch in ?0..?9, do: ch

  defp strip_non_alphanumeric(str), do: String.replace(str, ~r/[^[:alnum:]]/, "")
end
