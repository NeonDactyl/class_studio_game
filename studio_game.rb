require_relative 'game'

my_game = Game.new("Knuckleheads")
my_game.add_player(Player.new("moe"))
my_game.add_player(Player.new("larry", 60))
my_game.add_player(Player.new("curly", 125))

my_game.start

my_game.play
