defmodule Cards do
  @moduledoc """
    Provides methods for creating and handling a deck of cards
  """
  @doc """
    Returns a list of strings representing a deck of playing cards
  """
  def create_deck do
    values = ["Ace", "Two", "Three", "Four", "Five"]
    suits = ["Spades", "Clubs", "Hearts", "Diamonds"]

    # list comprehension - mapping function that returns a brand new (single) array
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

  @doc """
    Divides a deck into a hand and the remainder of the deck.
    The `hand_size` aergument indicates how many cards should be in the hand.
    It returns a tuple (fixed-size containers for multiple elements) => {hand: [], deck: []}

    ## Examples

        iex> deck = Cards.create_deck
        iex> {hand, deck} = Cards.deal(deck,1)
        iex> hand
        ["Ace of Spades"]
        
  """
  def deal(deck, hand_size) do
    Enum.split(deck, hand_size)
  end

  # saves our deck in a seperate file
  def save(deck, filename) do
    # turns list of strings into a binary object (erlang's definition of an object that can be safely stored in a non-erlang environment)
    binary = :erlang.term_to_binary(deck)

    # writes out object in the given file
    File.write(filename, binary)
  end

  # reads binary object and converts into Elixir code in case reading was successful 
  def load(filename) do
    # looks at result of File.read and pattern matches it against the case statement
    case File.read(filename) do
      {:ok, binary} -> :erlang.binary_to_term binary
      {:error, _reason} -> "That file does not exist"
    end
  end

  # calls multiple functions in one function using the pipe operator
  def create_hand(hand_size) do
    # result of each method is automatically sent on to the next method in the chain as first argument(!)
    Cards.create_deck
    |> Cards.shuffle
    |> Cards.deal(hand_size)
  end

end


# PATTERN MATCHING (elixir's replacement for variable assignments)
# {hand, rest_of_deck} = Cards.deal(cards, 5)

# [ color ] = [ "red"] # color => "red"
# color = [ "red"] # color => ["red"]

# [ color1, color2, color3 ] = [ "red", "blue"] # ERROR => pattern doesn't match