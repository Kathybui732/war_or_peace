class Turn
  attr_reader :player1,
              :player2,
              :spoils_of_war,
              :turn_number

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
    @turn_number = 0
    @turn_limit = 1000000
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
      else
        @player2
      end
    elsif type == :basic
      if @player1.deck.rank_of_card_at(0) > @player2.deck.rank_of_card_at(0)
        @player1
      else
        @player2
      end
    end
  end

  def pile_cards
    if type == :basic
      @spoils_of_war << @player1.deck.remove_card
      @spoils_of_war << @player2.deck.remove_card
    elsif type == :war
      @spoils_of_war << @player1.deck.remove_card
      @spoils_of_war << @player1.deck.remove_card
      @spoils_of_war << @player1.deck.remove_card
      @spoils_of_war << @player2.deck.remove_card
      @spoils_of_war << @player2.deck.remove_card
      @spoils_of_war << @player2.deck.remove_card
    elsif type == :mutually_assured_destruction
      3.times do
        @player1.deck.remove_card
        @player2.deck.remove_card
      end
    end
  end

  def game_messages
    if type == :basic
      puts "#{winner.name} won 2 cards"
    elsif type == :war
      puts "WAR - #{winner.name} won 6 cards"
    elsif type == :mutually_assured_destruction
      puts "*mutually assured destruction* 6 cards removed from play"
    end
  end

  def award_spoils(winner)
    if type == :mutually_assured_destruction
      @spoils_of_war = []
    elsif type == :war || type == :basic
      winner.deck.cards.push(@spoils_of_war).flatten!
    end
  end

  def empty_spoils
    @spoils_of_war = []
  end

  def next_turn
    @turn_number += 1
  end

  def game_over?
    @turn_number == @turn_limit || @player1.has_lost? || @player2.has_lost?
  end
end
