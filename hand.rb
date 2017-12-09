require_relative 'deck'

class Hand
  attr_accessor :cards, :deck

  def initialize(deck)
    @cards = []
    @deck = Deck.new
  end

  def add_card
    @cards << @deck.give_card
  end

  def count_score
    score = 0
    @cards.each do |card|
      score += card.nums == 'A' ? card.score_ace : card.score
    end
    score
  end

  def clear
    @cards.clear
  end
end
