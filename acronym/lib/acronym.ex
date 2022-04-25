defmodule Acronym do
  @doc """
  Generate an acronym from a string.
  "This is a string" => "TIAS"
  """
  @spec abbreviate(String.t()) :: String.t()
  def abbreviate(string) do
    string
    |> String.split(~r/[\s-_]/, trim: true)
    |> Enum.map_join(fn str ->
      str
      |> String.first()
      |> String.upcase()
    end)
  end
end
