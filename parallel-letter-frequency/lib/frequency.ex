defmodule Frequency do
  @doc """
  Count letter frequency in parallel.

  Returns a map of characters to frequencies.

  The number of worker processes to use can be set with 'workers'.
  """
  @spec frequency([String.t()], pos_integer) :: map
  def frequency(texts, workers) do
    texts
    |> Task.async_stream(&count_letters/1, max_concurrency: workers)
    |> merge_results()
  end

  defp count_letters(str) do
    str
    |> String.downcase()
    |> String.replace(~r/[^\p{L}]/u, "")
    |> String.graphemes()
    |> Enum.frequencies()
  end

  defp merge_results(task_results) do
    Enum.reduce(task_results, %{}, fn {:ok, m}, acc ->
      Map.merge(m, acc, fn _key, v1, v2 -> v1 + v2 end)
    end)
  end
end
