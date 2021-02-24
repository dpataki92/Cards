defmodule Cards do

  def create_deck do
    values = ["Ace", "Two", "Three", "Four", "Five"]
    suits = ["Spades", "Clubs", "Hearts", "Diamonds"]

    for suit <- suits, value <- values do
        "#{value} of #{suit}"
    end

  end

  # data structure passed is immutable!
  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  def contains?(deck, card) do
    Enum.member?(deck, card)
  end

  # returns a tuple (fixed-size containers for multiple elements) => {hand: [], deck: []}
  def deal(deck, hand_size) do
    Enum.split(deck, hand_size)
  end

end


# patter matching (elixir's replacement for variable assignments)
{hands, rest_of_deck} = Cards.deal(cards, 5)

[ color ] = [ "red"] # color => "red"
color = [ "red"] # color => ["red"]

[ color1, color2, color3 ] = [ "red", "blue"] # ERROR => pattern doesn't match