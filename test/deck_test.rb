
require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'

class DeckTest < Minitest::Test

  def setup
    @card1 = Card.new(:diamond, "Queen", 12)
    @card2 = Card.new(:spade, '3', 3)
    @card3 = Card.new(:heart, "Ace", 14)
    @cards = [@card1, @card2, @card3]
    @deck = Deck.new(@cards)
  end

  def test_it_exists

    # card1 = Card.new(:diamond, "Queen", 12)
    # card2 = Card.new(:spade, '3', 3)
    # card3 = Card.new(:heart, "Ace", 14)
    # cards = [card1, card2, card3]
    # deck = Deck.new(cards)

    deck = @deck

    assert_instance_of Deck, deck
  end

  def test_it_can_give_rank_of_cards_at_0
    # card1 = Card.new(:diamond, "Queen", 12)
    # card2 = Card.new(:spade, '3', 3)
    # card3 = Card.new(:heart, "Ace", 14)
    # cards = [card1, card2, card3]
    # deck = Deck.new(cards)

    deck = @deck

    assert_equal 12, deck.rank_of_card_at(0)
  end

  def test_it_can_give_rank_of_cards_at_2
    # card1 = Card.new(:diamond, "Queen", 12)
    # card2 = Card.new(:spade, '3', 3)
    # card3 = Card.new(:heart, "Ace", 14)
    # cards = [card1, card2, card3]
    # deck = Deck.new(cards)

    deck = @deck

    assert_equal 14, deck.rank_of_card_at(2)
  end

  def test_it_can_return_what_is_in_cards_array
    # card1 = Card.new(:diamond, "Queen", 12)
    # card2 = Card.new(:spade, '3', 3)
    # card3 = Card.new(:heart, "Ace", 14)
    # cards = [card1, card2, card3]
    # deck = Deck.new(cards)

    cards = @cards
    deck = @deck

    assert_equal cards, deck.cards
  end

  def test_it_knows_what_are_high_ranking_cards
    # card1 = Card.new(:diamond, "Queen", 12)
    # card2 = Card.new(:spade, '3', 3)
    # card3 = Card.new(:heart, "Ace", 14)
    # cards = [card1, card2, card3]
    # deck = Deck.new(cards)

    card1 = @card1
    card3 = @card3
    deck = @deck

    assert_equal [card1, card3], deck.high_ranking_cards
  end

  def test_it_can_give_percent_high_ranking_cards
    # card1 = Card.new(:diamond, "Queen", 12)
    # card2 = Card.new(:spade, '3', 3)
    # card3 = Card.new(:heart, "Ace", 14)
    # cards = [card1, card2, card3]
    # deck = Deck.new(cards)

    deck = @deck

    assert_equal 66.67, deck.percent_high_ranking
  end

  def test_it_can_remove_a_card
    # card1 = Card.new(:diamond, "Queen", 12)
    # card2 = Card.new(:spade, '3', 3)
    # card3 = Card.new(:heart, "Ace", 14)
    # cards = [card1, card2, card3]
    # deck = Deck.new(cards)
    deck = @deck
    card2 = @card2
    card3 = @card3

    expected = [card2, card3]
    assert_equal expected, deck.remove_card
    assert_equal [card3], deck.high_ranking_cards
    assert_equal 50.0, deck.percent_high_ranking
  end

  def test_can_it_add_card
    # card1 = Card.new(:diamond, "Queen", 12)
    # card2 = Card.new(:spade, '3', 3)
    # card3 = Card.new(:heart, "Ace", 14)
    # cards = [card1, card2, card3]
    # deck = Deck.new(cards)
    deck = @deck
    card2 = @card2
    card3 = @card3
    deck.remove_card
    card4 = Card.new(:club, "5", 5)

    assert_equal [card2, card3, card4], deck.add_card(card4)
    assert_equal [card3], deck.high_ranking_cards
    assert_equal 33.33, deck.percent_high_ranking
  end
end
