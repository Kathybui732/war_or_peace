require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'

class TurnTest < Minitest::Test

  def setup
    @card1 = Card.new(:heart, 'Jack', 11)
    @card2 = Card.new(:heart, '10', 10)
    @card3 = Card.new(:heart, '9', 9)
    @card4 = Card.new(:diamond, 'Jack', 11)
    @card5 = Card.new(:heart, '8', 8)
    @card6 = Card.new(:diamond, '8', 8)
    @card7 = Card.new(:heart, '3', 3)
    @card8 = Card.new(:diamond, '2', 2)

    @deck1 = Deck.new([@card1, @card2, @card5, @card8])
    @deck2 = Deck.new([@card4, @card3, @card6, @card7])

    @player1 = Player.new("Megan", @deck1)
    @player2 = Player.new("Aurora", @deck2)

    @turn = Turn.new(@player1, @player2)
  end

  def test_it_exists
    assert_instance_of Turn, @turn
  end

  def test_type_is_mutually_assured_destruction
    assert_equal :mutually_assured_destruction, @turn.type
  end

  def test_it_has_no_winner
    assert_equal "No Winner", @turn.winner
  end

  def test_it_will_not_pile_played_cards_to_spoils_of_war
    @turn.pile_cards
    assert_equal [], @turn.spoils_of_war
  end

  def test_cards_are_removed_from_both_players_decks
    @turn.pile_cards
    @turn.award_spoils(@turn.winner)
    assert_equal [@card8], @player1.deck.cards
    assert_equal [@card7], @player2.deck.cards
  end
end
