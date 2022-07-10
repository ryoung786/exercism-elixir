defmodule Garden do
  @doc """
    Accepts a string representing the arrangement of cups on a windowsill and a
    list with names of students in the class. The student names list does not
    have to be in alphabetical order.

    It decodes that string into the various gardens for each student and returns
    that information in a map.
  """

  @default_students ~w(alice bob charlie david eve fred ginny harriet ileana joseph kincaid larry)a

  @spec info(String.t(), list) :: map
  def info(info_string, student_names \\ @default_students) do
    student_names
    |> Enum.sort()
    |> Enum.with_index()
    |> Enum.reduce(%{}, fn {name, i}, acc ->
      plants = if i >= (String.length(info_string) - 1) / 4, do: {}, else: plants(info_string, i)
      Map.put(acc, name, plants)
    end)
  end

  defp plants(str, i) do
    str
    |> String.split("\n")
    |> Enum.flat_map(fn row -> [String.at(row, i * 2), String.at(row, i * 2 + 1)] end)
    |> Enum.map(&plant/1)
    |> List.to_tuple()
  end

  defp plant("V"), do: :violets
  defp plant("R"), do: :radishes
  defp plant("C"), do: :clover
  defp plant("G"), do: :grass
end
