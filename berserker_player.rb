require_relative 'player'

class BerserkerPlayer < Player
  def initialize(name, health=100)
    super
    @w00t_count = 0
  end

  def w00t
    super
    @w00t_count += 1
    if berserk?
      puts "#{@name} has gone berserk!"
    end
  end

  def blam
    if berserk?
      w00t
    else
      super
    end
  end

  def berserk?
    @w00t_count > 5
  end

  def to_s
    super
    puts "#{@name} is at #{@w00t_count} w00ts."
  end
end
