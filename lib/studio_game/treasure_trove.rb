Treasure = Struct.new(:name, :points)
module StudioGame
    module TreasureTrove
      TREASURES = []
      t_names = [:pie, :bottle, :hammer, :skillet, :broomstick, :crowbar]
      t_points = [5, 25, 50, 100, 200, 400]
      t_names.length.times do |idx|
        TREASURES.append(Treasure.new(t_names[idx], t_points[idx]))
      end

      def self.random
        TREASURES.sample
      end
    end
end
