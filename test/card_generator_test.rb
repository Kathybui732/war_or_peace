require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/starter'
require './lib/card_generator'

class CardGeneratorTest < Minitest::Test

  def test_it_exists
    playing_deck = CardGenerator.new
    assert_instance_of CardGenerator, playing_deck
  end

  def test_it_can_create_value_cards_from_2_to_10

  def test_it_has_52_cards
    playing_deck = CardGenerator.new

    expected_number_of_cards = 52
    assert_equal expected_number_of_cards, playing_deck.full_deck.count
  end

  def test_it_contains_2_to_10_array_of_value_cards
    playing_deck = CardGenerator.new

    assert_equal (2..10).to_a, playing_deck.values
  end

  def test_it_has_an_array_of_face_cards
    playing_deck = CardGenerator.new

    assert_equal ["Jack", "Queen", "King", "Ace"], playing_deck.face_cards
  end

  def test_it_has_13_face_and_value_cards
    playing_deck = CardGenerator.new

    assert_equal [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, "Jack", "Queen", "King", "Ace"], playing_deck.card_values
  end
end
