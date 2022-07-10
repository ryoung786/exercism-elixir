defmodule Gigasecond do
  @doc """
  Calculate a date one billion seconds after an input date.
  """
  @spec from({{pos_integer, pos_integer, pos_integer}, {pos_integer, pos_integer, pos_integer}}) ::
          {{pos_integer, pos_integer, pos_integer}, {pos_integer, pos_integer, pos_integer}}
  def from({{year, month, day}, {hours, minutes, seconds}}) do
    start = NaiveDateTime.new!(year, month, day, hours, minutes, seconds)
    result = NaiveDateTime.add(start, 1_000_000_000, :second)
    {{result.year, result.month, result.day}, {result.hour, result.minute, result.second}}
  end
end
