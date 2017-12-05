require_relative 'deck'



class Hand

  attr_accessor :user_cards, :dealer_cards, :user_sum, :dealer_sum

  def initialize
    @deck = Deck.new
    @user_cards =[]
    2.times {@user_cards << @deck.give_card}
    @dealer_cards = []
    2.times {@dealer_cards << @deck.give_card}
  end

  def user_take_card
    @user_cards << @deck.give_card
  end

  def dealer_take_card
    @dealer_cards << @deck.give_card if dealer_points < 18
  end

  def user_points
    sum = 0
    pic_sum = 0
    ace_sum = 0
    @user_sum = 0
    numbers = @user_cards.select { |x| x =~ /[0-9]/ }
    numbers.map!(&:to_i)
    numbers.each { |x| sum += x }
    pictures = @user_cards.select { |x| x =~ /[JQK]/ }
    pictures.each { |_x| pic_sum += 10 }

    aces = @user_cards.select { |x| x =~ /[A]/ }

    @user_sum = pic_sum + sum

    aces.each { |_x| ace_sum = 11 if @user_sum <= 10 }
    aces.each { |_x| ace_sum = 1 if @user_sum > 10 }
    if aces.length == 2
      ace_sum = 12
    elsif aces.length == 3
      ace_sum = 13
    end

    @user_sum += ace_sum
  end

  def dealer_points
    sum = 0
    pic_sum = 0
    ace_sum = 0
    @dealer_sum = 0
    numbers = @dealer_cards.select { |x| x =~ /[0-9]/ }
    numbers.map!(&:to_i)
    numbers.each { |x| sum += x }
    pictures = @dealer_cards.select { |x| x =~ /[JQK]/ }
    pictures.each { |_x| pic_sum += 10 }

    aces = @dealer_cards.select { |x| x =~ /[A]/ }

    @dealer_sum = pic_sum + sum

    aces.each { |_x| ace_sum = 11 if @dealer_sum <= 10 }
    aces.each { |_x| ace_sum = 1 if @dealer_sum > 10 }
    if aces.length == 2
      ace_sum = 12
    elsif aces.length == 3
      ace_sum = 13
    end

    @dealer_sum += ace_sum
  end

end