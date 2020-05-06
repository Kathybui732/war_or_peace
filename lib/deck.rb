class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def rank_of_card_at(position)
    cards[position].rank
  end

  def high_ranking_cards
    high_cards = cards.select do |value|
      value.rank >= 11
    end
  end

  def percent_high_ranking
    high_cards = cards.select do |value|
      value.rank >= 11
    end
    (high_cards.count / cards.count.to_f).round(4) * 100
  end

  def remove_card
    cards.shift
  end

  def add_card(card)
    @cards << card
  end

end
