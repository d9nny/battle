class Game

  attr_reader :current_turn, :attack

  def initialize(player_1, player_2)
    @players = [player_1, player_2]
    @current_turn = player_1
    @attack = attack
  end

  def player_1
    @players.first
  end

  def player_2
    @players.last
  end

  def opposite_player
    @players.select { |elem| elem != @current_turn }.first
  end

  def game_over?
    losing_player.any?
  end

  def switch
    @current_turn = opposite_player
  end

  private

  def losing_player
    @players.select { |player| player.hp <=0 }
  end
end