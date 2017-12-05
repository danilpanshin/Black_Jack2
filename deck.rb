require_relative 'card'

class Deck

  def initialize
    @new_deck = Card.new
  end

  def give_card    
    new_card = @new_deck.cards.sample
    @new_deck.cards.delete(new_card)
  end
end