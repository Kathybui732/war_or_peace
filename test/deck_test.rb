
require 'minitest/autorun'
require 'minitest/pride'
require '../lib/card'
require '../lib/deck'

class DeckTest < Minitest::Test

  def test_it_can_add_cards_to_deck

    card1 = Card.new(:diamond, "Queen", 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, "Ace", 14)

    cards = [card1, card2, card3]

    deck = Deck.new(cards)

    assert_equal cards, deck.cards
  end

  def test_rank_of_cards_at_0
    card1 = Card.new(:diamond, "Queen", 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, "Ace", 14)

    cards = [card1, card2, card3]

    deck = Deck.new(cards)

    assert_equal 12, deck.rank_of_card_at(0)
  end

  def test_rank_of_cards_at_2
    card1 = Card.new(:diamond, "Queen", 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, "Ace", 14)

    cards = [card1, card2, card3]

    deck = Deck.new(cards)

    assert_equal 14, deck.rank_of_card_at(2)
  end

  def test_what_is_in_cards
    card1 = Card.new(:diamond, "Queen", 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, "Ace", 14)

    cards = [card1, card2, card3]

    deck = Deck.new(cards)

    assert_equal cards, deck.cards
  end

  def test_what_are_high_ranking_cards
    card1 = Card.new(:diamond, "Queen", 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, "Ace", 14)

    cards = [card1, card2, card3]

    deck = Deck.new(cards)

    assert_equal [card1, card3], deck.high_ranking_cards
  end

  def test_percent_high_ranking
    card1 = Card.new(:diamond, "Queen", 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, "Ace", 14)

    cards = [card1, card2, card3]

    deck = Deck.new(cards)
    assert_equal 66.67, deck.percent_high_ranking
  end

  def test_can_it_remove_a_card
    card1 = Card.new(:diamond, "Queen", 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, "Ace", 14)

    cards = [card1, card2, card3]

    deck = Deck.new(cards)

    expected = [card2, card3]
    assert_equal = expected, deck.remove_card
  end

  # def test_can_it_add_card
  #   card1 = Card.new(:diamond, "Queen", 12)
  #   card2 = Card.new(:spade, '3', 3)
  #   card3 = Card.new(:heart, "Ace", 14)
  #
  #   cards = [card1, card2, card3]
  #
  #   deck = Deck.new(cards)
  #
  #   card4 = Card.new(:club, "5", 5)
  #
  #   deck.add_card(card4)
end
