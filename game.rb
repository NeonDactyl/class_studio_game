require_relative 'player'
require_relative 'die'
require_relative 'game_turn'
require_relative 'treasure_trove'

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
    puts @players.sort
    treasures = TreasureTrove::TREASURES
    puts "\nThere are #{treasures.size} treasures to be found:"
    treasures.each do |t|
      puts "#{t.name.capitalize} has #{t.points} points"
    end
  end

  def play(turns)
    1.upto(turns) do |turn|
      puts "\nRound #{turn}: "
      @players.each do |player|
        GameTurn.take_turn(player)
      end
    end
  end

  def print_stats
    strong, weak = @players.partition { |p| p.healthy? }
    puts "\nHealthy players:"
    puts strong

    puts "\nUnhealthy players:"
    puts weak
  end

  def show_high_scores
    puts "\n#{@title} High Scores:"
    @players.sort.each do |player|
      puts player.name.ljust(20, '.') + player.score.to_s.rjust(4, '.')
    end
  end

end
