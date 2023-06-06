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
   searching(numbers, key, 0, tuple_size(numbers) - 1)
  end

  defp searching(_numbers, _key, first, last) when first > last, do: :not_found
  defp searching(numbers, key, first, last) do
  middle_index = first + last |> div(2)
  middle_item = elem(numbers, middle_index)
  cond do
    key == middle_item -> {:ok, middle_index}
    key < middle_item -> searching(numbers, key, first, middle_index - 1)
    key > middle_item -> searching(numbers, key, middle_index + 1, last)
    true -> :not_found
  end
  end
end
