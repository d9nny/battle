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

  def sleeping?(player)
    player.sleeping?
  end

  def reduce_sleep_counter(player)
    player.reduce_sleep_counter
  end

  def attack_poison(player)
    player.receive_poison
  end

  def attack_random(player)
    player.receive_random
  end

  def opposite_player
    @players.select { |elem| elem != @current_turn }.first
  end

  def game_over?
    losing_player.any?
  end

  def switch_turn
    @current_turn = opposite_player
  end

  def computer?
    @current_turn.name == 'Computer'
  end

  private

  def losing_player
    @players.select { |player| player.hp <=0 }
  end
end
