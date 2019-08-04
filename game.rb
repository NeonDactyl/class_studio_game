require_relative 'player'
require_relative 'clumsy_player'
require_relative 'berserker_player'
require_relative 'die'
require_relative 'game_turn'
require_relative 'treasure_trove'

class Game
  def initialize(title)
    @title = title
    @players = []
    @d20 = Die.new(20)
  end

  def load(file_name)
    File.readlines(file_name).each do |line|
      add_player(Player.from_csv(line))
    end
  end

  def save(file_name)
    File.open(file_name, 'w') do |file|
      @players.sort.each do |player|
        file.puts "#{player.name},#{player.health}"
      end
    end
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
      if block_given?
        break if yield
      end
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

    @players.each do |p|
      puts "\n#{p.name} has the following treasure points:\n"
      p.each_treasure { |treasure| puts "#{treasure.name}: #{treasure.points} points"}
    end
  end

  def show_high_scores
    puts "\n#{@title} High Scores:"
    @players.sort.each do |player|
      puts player.name.ljust(20, '.') + player.score.to_s.rjust(4, '.')
    end
  end

  def total_points
    @players.reduce(0) do |sum, player|
      sum += player.points
    end
  end

end
