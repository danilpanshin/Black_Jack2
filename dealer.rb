require_relative 'player'

class Dealer < Player
  def move
    if hand.count_score < 18
      hand.add_card
    else
      false
    end
  end
end