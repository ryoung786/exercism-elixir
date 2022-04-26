defmodule BinarySearch do
  @doc """
    Searches for a key in the tuple using the binary search algorithm.
    It returns :not_found if the key is not in the tuple.
    Otherwise returns {:ok, index}.

    ## Examples

      iex> BinarySearch.search({}, 2)
      :not_found

      iex> BinarySearch.search({1, 3, 5}, 2)
      :not_found

      iex> BinarySearch.search({1, 3, 5}, 5)
      {:ok, 2}

  """

  @spec search(tuple, integer) :: {:ok, integer} | :not_found
  def search(numbers, key) do
    numbers
    |> Tuple.to_list()
    |> Enum.with_index()
    |> do_search(key)
  end

  defp do_search([], _key), do: :not_found

  defp do_search(numbers, key) do
    mid_idx = div(Enum.count(numbers), 2)

    case Enum.at(numbers, mid_idx) do
      {^key, i} ->
        {:ok, i}

      {n, _} when key > n ->
        numbers
        |> Enum.drop(mid_idx + 1)
        |> do_search(key)

      {_, _} ->
        numbers
        |> Enum.take(mid_idx)
        |> do_search(key)
    end
  end
end
