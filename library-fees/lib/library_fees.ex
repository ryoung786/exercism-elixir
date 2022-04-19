defmodule LibraryFees do
  def datetime_from_string(string) do
    NaiveDateTime.from_iso8601!(string)
  end

  def before_noon?(datetime) do
    datetime.hour < 12
  end

  def return_date(checkout_datetime) do
    days = if before_noon?(checkout_datetime), do: 28, else: 29

    checkout_datetime
    |> Date.add(days)
  end

  def days_late(planned_return_date, actual_return_datetime) do
    diff = Date.diff(actual_return_datetime, planned_return_date)
    if diff > 0, do: diff, else: 0
  end

  def monday?(datetime) do
    Date.day_of_week(datetime) == 1
  end

  def calculate_late_fee(checkout, return, rate) do
    due_date =
      checkout
      |> datetime_from_string()
      |> return_date()

    return_date = datetime_from_string(return)

    rate = if monday?(return_date), do: 0.5 * rate, else: rate

    (days_late(due_date, return_date) * rate) |> floor()
  end
end
