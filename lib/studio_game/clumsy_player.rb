require_relative 'player'

module StudioGame
    class ClumsyPlayer < Player
      def get_treasure(treasure)
        treasure.points /= 2
        super(treasure)
      end
    end
end
