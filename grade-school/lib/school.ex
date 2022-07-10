defmodule School do
  @moduledoc """
  Simulate students in a school.

  Each student is in a grade.
  """

  @type school :: any()

  @doc """
  Create a new, empty school.
  """
  @spec new() :: school
  # map from grade -> student names
  def new(), do: %{}

  @doc """
  Add a student to a particular grade in school.
  """
  @spec add(school, String.t(), integer) :: {:ok | :error, school}
  def add(school, name, grade) do
    existing_names = Map.values(school) |> Enum.flat_map(& &1)

    if name in existing_names,
      do: {:error, school},
      else: {:ok, Map.update(school, grade, [name], fn students -> [name | students] end)}
  end

  @doc """
  Return the names of the students in a particular grade, sorted alphabetically.
  """
  @spec grade(school, integer) :: [String.t()]
  def grade(school, grade) do
    school
    |> Map.get(grade, [])
    |> Enum.sort()
  end

  @doc """
  Return the names of all the students in the school sorted by grade and name.
  """
  @spec roster(school) :: [String.t()]
  def roster(school) do
    school
    |> Map.keys()
    |> Enum.sort()
    |> Enum.flat_map(&grade(school, &1))
  end
end
