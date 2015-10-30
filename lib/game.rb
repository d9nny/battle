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

  def attack_basic(player)
    player.receive_basic
  end

  def attack_paralyse(player)
    player.receive_paralyse
  end

  def attack_sleep(player)
    player.receive_sleep
  end

  def attack_poison(player)
    player.receive_poison
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
