class Card

  attr_accessor :nums, :suits

  def initialize(num, suits)
    @nums = num
    @suits = suits
  end

  def score_ace
    score > 10 ? 1 : 11
  end

  def score
    @nums.to_i.zero? ? 10 : @nums.to_i
  end
end