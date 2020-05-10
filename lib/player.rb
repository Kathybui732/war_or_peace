class Player
  attr_reader :name, :deck

  def initialize(name, deck)
    @name = name
    @deck = deck
  end

  def has_lost?
    @deck.cards == []
  end

  def not_enough_cards?
    @deck.cards.count < 3
  end
end
