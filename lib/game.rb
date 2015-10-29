class Game

  attr_reader :current_turn

  def initialize(player_1, player_2)
    @players = [player_1, player_2]
    @current_turn = player_1
  end

  def player_1
    @players.first
  end

  def player_2
    @players.last
  end

  def attack(player)
    player.receive_damage
    switch
  end

  def opposite_player
    @players.select { |elem| elem != @current_turn }.first
  end

  def game_over?
    losing_player.any?
  end

  private

  def switch
    @current_turn = opposite_player
  end

  def losing_player
    @players.select { |player| player.hp <=0 }
  end
end