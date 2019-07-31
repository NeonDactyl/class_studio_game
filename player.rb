class Player

  attr_accessor :name
  attr_reader :health

  def initialize(name, health=100)
    @name = name.capitalize
    @health = health
  end

  def to_s
    "I'm #{@name} with a health of #{@health} and a score of #{score} (#{status})."
  end

  def blam
    puts("#{@name} got blammed!")
    @health -= 10
  end

  def w00t
    puts("#{@name} got w00ted!")
    @health += 15
  end

  def score
    @health + @name.length
  end

  def name=(new_name)
    @name = new_name.capitalize
  end

  def healthy?
    @health >= 150
  end

  def status
    healthy? ? "Healthy" : "Not healthy"
  end

  def <=>(other_player)
    other_player.score <=> score
  end

end
