class Player
	attr_reader :name, :hp

  DEFAULT_HP = 100

	def initialize(name)
		@name = name
    @hp = DEFAULT_HP
    @paralysed = false
    @sleeping = false
    @poisoned = false
    @attacks = [:basic,:poison,:paralyse,:sleep]
    @die = [1,2,3,4,5,6,7,8]
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
    @sleeping = true if @die.sample == 1 
    receive(random_damage(1..8))
  end

  def paralysed?
    @paralysed 
  end

  def poisoned?
    @poisoned 
  end

  def sleeping?
    @sleeping 
  end


  private
  def receive(damage)
    @hp -= damage
  end

  def random_damage(range)
    Kernel.rand(range)
  end
end


p = Player.new("dan")

p p.receive_basic

p p.hp
