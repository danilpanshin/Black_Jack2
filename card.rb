class Card

  attr_accessor :cards

  def initialize
    nums = %w[2 3 4 5 6 7 8 9 10 J Q K A]
    suits = %w[+ ^ <> <3]
    @cards = []
    nums.each do |n|
      suits.each do |s|
        @cards << n+s
      end
    end
    @cards.shuffle!
  end
end