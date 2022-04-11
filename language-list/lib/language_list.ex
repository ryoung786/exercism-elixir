defmodule LanguageList do
  def new() do
    []
  end

  def add(list, language) do
    [language | list]
  end

  def remove([_ | list]) do
    list
  end

  def first([el | _]) do
    el
  end

  def count(list) do
    Kernel.length(list)
  end

  def exciting_list?(list) do
    "Elixir" in list
  end
end
