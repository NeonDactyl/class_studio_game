require_relative 'die'
require_relative 'player'
require_relative 'treasure_trove'

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
    player.get_treasure(treasure)
  end
end
