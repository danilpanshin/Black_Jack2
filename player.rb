require_relative 'hand'
require_relative 'deck'

class Player
  attr_accessor :stack, :hand

  def initialize(deck)
    @bank = 100
    @hand = Hand.new(deck)
  end

  def bet
    @bank -= 10
  end

  def win
    @bank += 20
  end

  def draw
    @bank += 10
  end

  def stack
    @bank
  end
end
