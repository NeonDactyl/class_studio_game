require_relative 'die'
require_relative 'player'

module GameTurn

  def self.take_turn(player)
    number_roll = Die.new(20).roll
    case number_roll
      when 15..20
        player.w00t
      when 1..5
        player.blam
      else
        puts "Nothing happened to #{player.name}"
    end
    treasure = TreasureTrove.random
    puts "#{player.name} found a #{treasure.name} worth #{treasure.points} points."
  end
end
