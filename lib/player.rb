class Player
	attr_reader :name, :hp

  DEFAULT_HP = 100

	def initialize(name)
		@name = name
    @hp = DEFAULT_HP
	end

  def receive_damage
    @hp -= randomness
  end

  private

  def randomness
    Kernel.rand(1..10)
  end
end