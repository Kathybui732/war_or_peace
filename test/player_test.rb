require 'minitest/autorun'
require 'minitest/pride'
require './lib/player'
require './lib/card'
require './lib/deck'

class PlayerTest < Minitest::Test

  def test_player_has_a_name
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    deck = Deck.new([card1, card2, card3])
    player = Player.new('Clarisa', deck)

    assert_equal "Clarisa", player.name
  end

  def test_it_has_a_deck
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    deck = Deck.new([card1, card2, card3])
    player = Player.new('Clarisa', deck)

    assert_equal deck, player.deck
  end

  def test_it_has_lost
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    deck = Deck.new([card1, card2, card3])
    player = Player.new('Clarisa', deck)

    assert_equal false, player.has_lost?
  end

  def test_player_can_remove_card_from_deck
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    deck = Deck.new([card1, card2, card3])
    player = Player.new('Clarisa', deck)

    assert_equal card1, player.deck.remove_card
    assert_equal false, player.has_lost?
    assert_equal card2, player.deck.remove_card
    assert_equal false, player.has_lost?
    assert_equal card3, player.deck.remove_card
    assert_equal true, player.has_lost?
  end

  def test_player_has_no_cards_in_deck
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    deck = Deck.new([card1, card2, card3])
    player = Player.new('Clarisa', deck)
    3.times do
      player.deck.remove_card
    end

    assert_equal deck, player.deck
  end

end
