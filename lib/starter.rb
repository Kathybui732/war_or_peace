class Starter
  attr_reader :turn

  def initialize(turn)
    @turn = turn
  end

  def start
    until @turn.game_over? do
      @turn.next_turn
      print "Turn #{@turn.turn_number}: #{@turn.game_messages}"
      @turn.pile_cards
      @turn.award_spoils(turn.winner)
      @turn.empty_spoils
      if @turn.game_over?
        if @turn.turn_number == 1000000 || @turn.winner == "No Winner"
          print "---- DRAW ----"
        else
          print "*~*~*~* #{turn.winner.name} has won the game! *~*~*~*"
        end
      end
    end
  end
end
