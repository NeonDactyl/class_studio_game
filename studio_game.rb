require_relative 'game'

my_game = Game.new("Knuckleheads")
my_game.add_player(Player.new("moe"))
my_game.add_player(Player.new("larry", 60))
my_game.add_player(Player.new("curly", 125))

my_game.start

TURNS = 15

my_game.play(TURNS) do
  my_game.total_points >= 5500
end
my_game.print_stats
my_game.show_high_scores
puts "\nTotal points across all players: #{my_game.total_points}"
