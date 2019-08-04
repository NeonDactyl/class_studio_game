require_relative 'game'

my_game = Game.new("Knuckleheads")
$player_file = ARGV.shift
my_game.load($player_file || 'players.csv')
my_game.add_player(BerserkerPlayer.new('berserker'))
my_game.start

loop do
  puts "How many turns would you like to play?"
  turns = gets.chomp
  if ['q', 'quit', 'exit'].include? turns
    my_game.save($player_file || 'players.csv')
    break
  end

  my_game.play(turns.to_i)
end
my_game.print_stats
my_game.show_high_scores
puts "\nTotal points across all players: #{my_game.total_points}"
