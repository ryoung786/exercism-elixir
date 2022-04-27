defmodule ProteinTranslation do
  @doc """
  Given an RNA string, return a list of proteins specified by codons, in order.
  """
  @spec of_rna(String.t()) :: {:ok, list(String.t())} | {:error, String.t()}
  def of_rna(rna) do
    codons =
      rna
      |> String.graphemes()
      |> Enum.chunk_every(3)
      |> Enum.map(fn codon -> codon |> Enum.join() |> of_codon() end)

    with codons <- Enum.take_while(codons, fn {_status, codon} -> codon != "STOP" end),
         true <- Enum.all?(codons, fn {status, _} -> status == :ok end),
         codons <- Enum.map(codons, fn {:ok, codon} -> codon end) do
      {:ok, codons}
    else
      _ -> {:error, "invalid RNA"}
    end
  end

  @spec of_codon(String.t()) :: {:ok, String.t()} | {:error, String.t()}
  def of_codon("UGU"), do: {:ok, "Cysteine"}
  def of_codon("UGC"), do: {:ok, "Cysteine"}
  def of_codon("UUA"), do: {:ok, "Leucine"}
  def of_codon("UUG"), do: {:ok, "Leucine"}
  def of_codon("AUG"), do: {:ok, "Methionine"}
  def of_codon("UUU"), do: {:ok, "Phenylalanine"}
  def of_codon("UUC"), do: {:ok, "Phenylalanine"}
  def of_codon("UCU"), do: {:ok, "Serine"}
  def of_codon("UCC"), do: {:ok, "Serine"}
  def of_codon("UCA"), do: {:ok, "Serine"}
  def of_codon("UCG"), do: {:ok, "Serine"}
  def of_codon("UGG"), do: {:ok, "Tryptophan"}
  def of_codon("UAU"), do: {:ok, "Tyrosine"}
  def of_codon("UAC"), do: {:ok, "Tyrosine"}
  def of_codon("UAA"), do: {:ok, "STOP"}
  def of_codon("UAG"), do: {:ok, "STOP"}
  def of_codon("UGA"), do: {:ok, "STOP"}
  def of_codon(_), do: {:error, "invalid codon"}
end
