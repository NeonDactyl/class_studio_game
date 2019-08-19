module StudioGame
    class Die

      attr_accessor :sides
      attr_reader :last_roll

      def initialize(sides)
        @sides = sides
        roll
      end

      def roll
        @last_roll = rand(1..@sides)
        @last_roll
      end

    end
end
