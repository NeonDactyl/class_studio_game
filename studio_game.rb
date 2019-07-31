require_relative 'game'

my_game = Game.new("Knuckleheads")
my_game.add_player(Player.new("moe"))
my_game.add_player(Player.new("larry", 60))
my_game.add_player(Player.new("curly", 125))

my_game.start

TURNS = 2

my_game.play(TURNS)
my_game.print_stats
my_game.show_high_scores
