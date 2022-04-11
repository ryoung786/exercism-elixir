defmodule BirdCount do
  def today([]), do: nil
  def today([el | _]), do: el

  def increment_day_count([]), do: [1]
  def increment_day_count([el | rest]), do: [el + 1 | rest]

  def has_day_without_birds?([]), do: false
  def has_day_without_birds?([0 | _]), do: true
  def has_day_without_birds?([_ | rest]), do: has_day_without_birds?(rest)

  def total([]), do: 0
  def total([day | rest]), do: day + total(rest)

  def busy_days([]), do: 0
  def busy_days([day | rest]) when day >= 5, do: 1 + busy_days(rest)
  def busy_days([_day | rest]), do: busy_days(rest)
end
