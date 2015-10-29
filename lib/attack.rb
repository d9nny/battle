class Attack              
  attr_reader :player, :game

  def initialize(player, game)
    @player = player
    @game = game
  end

  def run(damage)
    @player.receive(damage)
    @game.switch
  end 

  def basic
    damage = Kernel.rand(1..10)
    run(damage)
  end

  def paralyse
    damage = Kernel.rand(1..10)
    run(damage)
  end

  def poison
    damage = Kernel.rand(1..10)
    run(damage)
  end

  def sleep
    damage = Kernel.rand(1..10)
    run(damage)
  end
end