class Player
	attr_reader :name, :hp

  DEFAULT_HP = 100

	def initialize(name)
		@name = name
    @hp = DEFAULT_HP
    @paralysed = false
    @sleeping = false
	end

  def receive_basic
    receive(Kernel.rand(1..10))
  end

  def receive_paralyse
    @paralysed = true
  end

  def receive_poison
    receive(Kernel.rand(1..15))
  end

  def receive_sleep
    @sleeping = true
  end

  def paralysed?
    @paralysed
  end

  def sleeping?
    @sleeping
  end


  private
  def receive(damage)
    @hp -= damage
  end
end
