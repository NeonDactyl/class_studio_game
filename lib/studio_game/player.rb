require_relative 'treasure_trove'
module StudioGame
    class Player

      attr_accessor :name
      attr_reader :health


      def initialize(name, health=100)
        @name = name.capitalize
        @health = health
        @treasures = Hash.new(0)
      end

      def to_s
        "I'm #{@name} with a health of #{@health} and a score of #{score} (#{status})."
      end

      def to_csv
        "#{@name},#{@health}"
      end

      def self.from_csv(line)
        name, health = line.split(',')
        health = (health == nil) ? 150 : Integer(health)
        Player.new(name, health)
      end

      def blam
        puts("#{@name} got blammed!")
        @health -= 10
      end

      def w00t
        puts("#{@name} got w00ted!")
        @health += 15
      end

      def score
        @health + @treasures.values.sum
      end

      def points
        @treasures.values.sum
      end

      def name=(new_name)
        @name = new_name.capitalize
      end

      def healthy?
        score >= 150
      end

      def status
        healthy? ? "Strong" : "Not strong"
      end

      def <=>(other_player)
        other_player.score <=> score
      end

      def get_treasure(treasure)
        @treasures[treasure.name] += treasure.points
        puts "#{@name} got a #{treasure.name} worth #{treasure.points} points."
      end

      def each_treasure
        @treasures.each do |name, points|
          yield(Treasure.new(name, points))
        end
      end

    end
end
