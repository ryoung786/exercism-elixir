defmodule WineCellar do
  def explain_colors do
    [
      white: "Fermented without skin contact.",
      red: "Fermented with skin contact using dark-colored grapes.",
      rose: "Fermented with some skin contact, but not enough to qualify as a red wine."
    ]
  end

  def filter(cellar, color, opts \\ []) do
    cellar
    |> Keyword.get_values(color)
    |> maybe_filter_year(Keyword.get(opts, :year))
    |> maybe_filter_country(Keyword.get(opts, :country))
  end

  defp maybe_filter_year(winelist, nil), do: winelist

  defp maybe_filter_year(winelist, year) do
    Enum.filter(winelist, fn
      {_, ^year, _} -> true
      _ -> false
    end)
  end

  defp maybe_filter_country(winelist, nil), do: winelist

  defp maybe_filter_country(winelist, country) do
    Enum.filter(winelist, fn
      {_, _, ^country} -> true
      _ -> false
    end)
  end
end
