class Player
  attr_reader :name, :deck

  def initialize(name, deck)
    @name = name
    @deck = deck
  end

  def has_lost?
    @deck.cards == []
  end

  def third_card
    @deck.rank_of_card_at(2)
  end

  def first_card
    @deck.rank_of_card_at(0)
  end

  def lose_card
    @deck.remove_card
  end
end
