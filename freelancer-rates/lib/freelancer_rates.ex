defmodule FreelancerRates do
  @hours_per_day 8.0
  @billable_days_per_month 22

  def daily_rate(hourly_rate) do
    hourly_rate * @hours_per_day
  end

  def apply_discount(before_discount, discount) do
    (1 - discount / 100) * before_discount
  end

  def monthly_rate(hourly_rate, discount) do
    (daily_rate(hourly_rate) * @billable_days_per_month)
    |> apply_discount(discount)
    |> Kernel.ceil()
  end

  def days_in_budget(budget, hourly_rate, discount) do
    true_daily_rate = hourly_rate |> daily_rate() |> apply_discount(discount)
    (budget / true_daily_rate) |> Float.floor(1)
  end
end
