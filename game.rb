require_relative 'player'
require_relative 'die'

class Game
  def initialize(title)
    @title = title
    @players = []
    @d20 = Die.new(20)
  end

  def add_player(player)
    @players << player
  end

  def start
    puts "There are #{@players.size} players in #{@title}:"
    @players.each do |player|
      puts player
    end
  end

  def play
    number_roll = @d20.roll
    case number_roll
      when 15..20
        @players.each do |player|
          player.w00t
        end
      when 1..5
        @players.each do |player|
          player.blam
        end
      else
        @players.each do |player|
          puts "Nothing happened to #{player.name}"
        end
      end

  end

end
