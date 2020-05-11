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
    @card6 = Card.new(:diamond, 'Queen', 12)
    @card7 = Card.new(:heart, '3', 3)
    @card8 = Card.new(:diamond, '2', 2)
    @card9 = Card.new(:diamond, '8', 8)

    @deck1 = Deck.new([@card1, @card2, @card5, @card8])
    @deck2 = Deck.new([@card3, @card4, @card6, @card7])

    @deck3 = Deck.new([@card1, @card2, @card5, @card8])
    @deck4 = Deck.new([@card4, @card3, @card6, @card7])

    @deck5 = Deck.new([@card1, @card2, @card5, @card8])
    @deck6 = Deck.new([@card4, @card3, @card9, @card7])

    @player1 = Player.new("Megan", @deck1)
    @player2 = Player.new("Aurora", @deck2)

    @player3 = Player.new("Megan", @deck3)
    @player4 = Player.new("Aurora", @deck4)

    @player5 = Player.new("Megan", @deck5)
    @player6 = Player.new("Aurora", @deck6)

    @turn1 = Turn.new(@player1, @player2)
    @turn2 = Turn.new(@player3, @player4)
    @turn3 = Turn.new(@player5, @player6)
  end

  def test_basic_turn_exists
    assert_instance_of Turn, @turn1
  end

  def test_playey1_exists
    assert_equal @player1, @turn1.player1
  end

  def test_player2_exists
    assert_equal @player2, @turn1.player2
  end

  def test_it_has_empty_spoils_of_war
    assert_equal [], @turn1.spoils_of_war
  end

  def test_turn_type_is_basic
    assert_equal :basic, @turn1.type
  end

  def test_basic_winner_is_player1
    assert_equal @player1, @turn1.winner
  end

  def test_basic_cards_are_piled_into_spoils_of_war
    @turn1.pile_cards
    assert_equal [@card1, @card3], @turn1.spoils_of_war
  end

  def test_basic_spoils_of_war_added_to_winner_deck
    @turn1.pile_cards
    @turn1.award_spoils(@player1)
    assert_equal [@card2, @card5, @card8, @card1, @card3], @player1.deck.cards
    assert_equal [@card4, @card6, @card7], @player2.deck.cards
  end

  def test_war_turn_exists
    assert_instance_of Turn, @turn2
  end

  def test_turn_type_is_war
    assert_equal :war, @turn2.type
  end

  def test_war_winner_is_player4
    assert_equal @player4, @turn2.winner
  end

  def test_war_cards_are_piled_into_spoils_of_war
    @turn2.pile_cards
    assert_equal [@card1, @card2, @card5, @card4, @card3, @card6], @turn2.spoils_of_war
  end

  def test_war_spoils_of_war_added_to_winner_deck
    @turn2.pile_cards
    @turn2.award_spoils(@turn2.winner)
    assert_equal [@card8], @player3.deck.cards
    assert_equal [@card7, @card1, @card2, @card5, @card4, @card3, @card6], @player4.deck.cards
  end

  def test_mad_turn_exists
    assert_instance_of Turn, @turn3
  end

  def test_turn_type_is_mad
    assert_equal :mutually_assured_destruction, @turn3.type
  end

  def test_mad_has_no_winner
    assert_equal "No Winner", @turn3.winner
  end

  def test_mad_will_not_pile_cards_to_spoils_of_war
    @turn3.pile_cards
    assert_equal [], @turn3.spoils_of_war
  end

  def test_mad_spoils_of_war_are_removed_from_both_players_decks
    @turn3.pile_cards
    @turn3.award_spoils(@turn3.winner)
    assert_equal [@card8], @player5.deck.cards
    assert_equal [@card7], @player6.deck.cards
  end
end
