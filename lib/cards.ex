defmodule Cards do

  def create_deck do
    ["Ace", "Two", "Three"]
  end

  # data structure passed is immutable!
  def shuffle(deck) do
    Enum.shuffle(deck)
  end

end
