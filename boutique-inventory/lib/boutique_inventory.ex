defmodule BoutiqueInventory do
  def sort_by_price(inventory) do
    inventory
    |> Enum.sort_by(& &1.price)
  end

  def with_missing_price(inventory) do
    inventory
    |> Enum.filter(fn
      %{price: nil} -> true
      _ -> false
    end)
  end

  def update_names(inventory, old_word, new_word) do
    inventory
    |> Enum.map(fn item ->
      %{item | name: String.replace(item.name, old_word, new_word)}
    end)
  end

  def increase_quantity(item, count) do
    q = item.quantity_by_size
    new_quantities = Map.new(q, fn {k, v} -> {k, v + count} end)
    %{item | quantity_by_size: new_quantities}
  end

  def total_quantity(item) do
    item.quantity_by_size
    |> Map.values()
    # Enum.sum() is cleaner
    |> Enum.reduce(0, &Kernel.+/2)
  end
end
