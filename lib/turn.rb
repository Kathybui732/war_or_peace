class Turn
  attr_reader :player1,
              :player2,
              :spoils_of_war

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
  end

  def type
    if @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0) && player1.deck.rank_of_card_at(2) == player2.deck.rank_of_card_at(2)
      :mutually_assured_destruction
    elsif @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0)
      :war
    else
      :basic
    end
  end

  def winner
    if type == :mutually_assured_destruction
      "No Winner"
    elsif type == :war
      if @player1.deck.rank_of_card_at(2) > @player2.deck.rank_of_card_at(2)
        @player1
      elsif @player1.deck.rank_of_card_at(2) < @player2.deck.rank_of_card_at(2)
        @player2
      end
    elsif type == :basic
      if @player1.deck.rank_of_card_at(0) > @player2.deck.rank_of_card_at(0)
        @player1
      elsif @player1.deck.rank_of_card_at(0) < @player2.deck.rank_of_card_at(0)
        @player2
      end
    end
  end

  def pile_cards
    # Cards played from player1 and player2 are stacked into spoils of war
    if type == :basic
      @spoils_of_war.push(player1.deck.remove_card, player2.deck.remove_card)
    elsif type == :war
      @spoils_of_war.push(player1.deck.remove_card, player1.deck.remove_card, player1.deck.remove_card, player2.deck.remove_card, player2.deck.remove_card, player2.deck.remove_card)
    elsif type == :mutually_assured_destruction
      3.times do
        player1.deck.remove_card
        player2.deck.remove_card
      end
    end
  end

  def award_spoils(turn_winner)
    if type == :mutually_assured_destruction
      @spoils_of_war = []
    elsif type == :war || :basic
      turn_winner.deck.add_card(@spoils_of_war).flatten!
    end
  end
end
