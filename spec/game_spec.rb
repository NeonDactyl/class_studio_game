require 'studio_game/game'

module StudioGame

    describe Game do

      before do
        @game = Game.new("Halo")
        $stdout = StringIO.new
      end

      context "being played with one player" do
        before do
          @initial_health = 150
          @player = Player.new("master chief", @initial_health)
          @game.add_player(@player)
        end

        it "increases health if high number rolled" do
          allow_any_instance_of(Die).to receive(:roll).and_return(20)
          @game.play

          expect(@player.health).to eq(@initial_health + 15)
        end

        it "maintains health if medium number rolled" do
          allow_any_instance_of(Die).to receive(:roll).and_return(10)
          @game.play

          expect(@player.health).to eq(@initial_health)
        end

        it "decreases health if low number rolled" do
          allow_any_instance_of(Die).to receive(:roll).and_return(2)
          @game.play

          expect(@player.health).to eq(@initial_health - 10)
        end

      end
    end
end
