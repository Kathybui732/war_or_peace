gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require '../lib/card.rb'
require '../lib/deck'

class DeckTest < Minitest::Test

  def it_can_add_cards_to_deck

    card1 = Card.new(:diamond, "Queen", 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, "Ace", 14)

    deck = Deck.new(cards)
    deck.add(card1)
    deck.add(card2)
    deck.add(card3)

    expected = [card1, card2, card3]

    assert_equal expected, deck.cards
  end
end
