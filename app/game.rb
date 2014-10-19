class Game

  attr_accessor :choices, :player1, :player2

  def initialize(choices = [])
    @choices = choices
  end

  def add_player(player)
    self.player1 ?  self.player2 = player : self.player1 = player
  end

  def add_choice(choice)
    choices << choice
  end

  def random_choice
    choices.sample
  end

end
