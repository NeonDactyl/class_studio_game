require "studio_game/player"

module StudioGame
    describe Player do

      before do
        @initial_health = 200
        @p = Player.new("moe", @initial_health)
        $stdout = StringIO.new
      end

      it "has a capital name" do
        expect(@p.name).to eq("Moe")
      end

      it "has a changeable inital health" do
        expect(@p.health).to eq(@initial_health)
      end

      it "takes damage when blammed" do
        @p.blam
        expect(@p.health).to be < @initial_health
      end

      it "gains health when w00ted" do
        @p.w00t
        expect(@p.health).to be > @initial_health
      end

      it "has a string representation" do
        expect(@p.to_s).to eq("I'm Moe with a health of 200 and a score of 203 (Healthy).")
      end

      it "computes a score as sum of its health and length of name" do
        expect(@p.score).to eq(@p.name.length + @p.health)
      end

      context "created with default health" do
        before do
          @p = Player.new("moe")
        end

        it "has a default health of 100" do
          expect(@p.health).to eq(100)
        end
      end

      context "health at least 150" do
        before do
          @p = Player.new("moe", 150)
        end

        it "is healthy" do
          expect(@p).to be_healthy
        end

        it "has healthy status" do
          expect(@p.status).to eq("Healthy")
        end
      end

      context "health less than 150" do
        before do
          @p = Player.new("moe", 120)
        end

        it "is not healthy" do
          expect(@p).to_not be_healthy
        end

        it "has not healthy status" do
          expect(@p.status).to eq("Not healthy")
        end
      end

    end
end
