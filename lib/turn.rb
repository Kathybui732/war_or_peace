class Turn
  attr_reader :player1,
              :player2,
              :spoils_of_war,
              :type

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
    @type = :basic
  end

  def winner
    if player1.deck.rank_of_card_at(0) > player2.deck.rank_of_card_at(0)
      @type = :basic
      player1
    elsif player1.deck.rank_of_card_at(0) < player2.deck.rank_of_card_at(0)
      @type = :basic
      player2
    elsif player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0)
      @type = :war
      if player1.deck.rank_of_card_at(2) > player2.deck.rank_of_card_at(2)
        player1
      elsif player1.deck.rank_of_card_at(2) < player2.deck.rank_of_card_at(2)
        player2
      elsif player1.deck.rank_of_card_at(2) == player2.deck.rank_of_card_at(2)
        @type = :mutually_assured_destruction
        "No winner"
      end
    end
  end

  # def pile_cards
  #   Cards played from player1 and player2 are stacked into spoils of war
  # end
  #
  # def award_spoils(winner)
  #   winner.deck << @spoils_of_war; cards from spoils of war added to winner dieck
  # end
end
