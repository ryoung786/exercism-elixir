defmodule Chessboard do
  def rank_range, do: 1..8

  def file_range, do: ?A..?H

  def ranks do
    for rank <- rank_range(), do: rank
  end

  def files do
    for file <- file_range(), do: <<file>>
  end
end
