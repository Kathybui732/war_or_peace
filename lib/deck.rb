class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def rank_of_card_at(position)
    # @cards[position].rank
    if @cards[position] == nil
      0
    else
      @cards[position].rank
    end
  end

  def high_ranking_cards
    high_cards = cards.select do |value|
      value.rank >= 11
    end
  end

  def percent_high_ranking
    percent = (high_ranking_cards.count / cards.count.to_f) * 100
    percent.round(2)
  end

  def remove_card
    @cards.shift
  end

  def add_card(card)
    @cards << card
  end

end
