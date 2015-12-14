class Player
	attr_reader :name, :hp, :sleep_counter

  DEFAULT_HP = 100

	def initialize(name)
		@name = name
    @hp = DEFAULT_HP
    @paralysed = false
    @poisoned = false
    @attacks = [:basic,:poison,:paralyse,:sleep]
    @die = [1,2,3,4,5,6,7,8]
    @sleep_counter = 0
	end

   def receive_random
    attack_type = ""
    case @attacks.sample
    when :basic
      receive_basic
      attack_type = "basic"
    when :poison
      receive_poison
      attack_type = "poison"
    when :paralyse
      receive_paralyse
      attack_type = "paralyse"
    when :sleep
      receive_sleep
      attack_type = "sleep"
    end
    attack_type
  end

  def receive_basic
    receive(random_damage(1..20))
  end

  def receive_paralyse
    @paralysed = true if @die.sample == 1 || 2 || 3
    receive(random_damage(1..12))
  end

  def receive_poison
    @poisened = true if @die.sample == 1 || 2
    receive(random_damage(1..9))
  end

  def receive_sleep
    @sleep_counter += 1
  end

  def reduce_sleep_counter
    @sleep_counter -= 1
  end

  def sleeping?
    @sleep_counter > 0
  end

  private
  def receive(damage)
    @hp -= damage
  end

  def random_damage(range)
    Kernel.rand(range)
  end
end

