class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = Array.new
  end

  def rank_of_card_at(position)
    @cards[position]
  end

  def high_ranking_cards
    high_cards = cards.select do |value|
      cards.rank > 11
    end
  end

  def percent_high_ranking
    (@cards.count / high_cards.count) * 100
  end

  def remove_card
    @cards.shift
  end

  def add_card(card)
    @cards << card
  end
end
