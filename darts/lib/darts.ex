defmodule Darts do
  @type position :: {number, number}

  @inner_radius 1
  @middle_radius 5
  @outer_radius 10

  @doc """
  Calculate the score of a single dart hitting a target
  """
  @spec score(position) :: integer
  def score({x, y}) do
    radius = dist({x, y})

    cond do
      radius > @outer_radius -> 0
      radius > @middle_radius -> 1
      radius > @inner_radius -> 5
      :bullseye -> 10
    end
  end

  defp dist({x, y}), do: :math.sqrt(x * x + y * y)
end
