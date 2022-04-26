defmodule Allergies do
  use Bitwise

  @doc """
  List the allergies for which the corresponding flag bit is true.
  """
  @spec list(non_neg_integer) :: [String.t()]
  def list(flags) do
    ~w(eggs peanuts shellfish strawberries tomatoes chocolate pollen cats)
    |> Enum.filter(&allergic_to?(flags, &1))
  end

  @doc """
  Returns whether the corresponding flag bit in 'flags' is set for the item.
  """
  @spec allergic_to?(non_neg_integer, String.t()) :: boolean
  def allergic_to?(flags, "eggs"), do: (flags &&& 1) == 1
  def allergic_to?(flags, "peanuts"), do: (flags &&& 2) == 2
  def allergic_to?(flags, "shellfish"), do: (flags &&& 4) == 4
  def allergic_to?(flags, "strawberries"), do: (flags &&& 8) == 8
  def allergic_to?(flags, "tomatoes"), do: (flags &&& 16) == 16
  def allergic_to?(flags, "chocolate"), do: (flags &&& 32) == 32
  def allergic_to?(flags, "pollen"), do: (flags &&& 64) == 64
  def allergic_to?(flags, "cats"), do: (flags &&& 128) == 128
end
