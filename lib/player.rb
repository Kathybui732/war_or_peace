class Player
  attr_reader :name, :deck

  def initialize(name, player_deck)
    @name = name
    @player_deck = player_deck
  end
end
