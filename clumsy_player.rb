require_relative 'player'

class ClumsyPlayer < Player
  def get_treasure(treasure)
    treasure.points /= 2
    super(treasure)
  end
end
