require_relative 'hand'

require_relative 'bank'

class Game

  attr_accessor :hand, :bank

  def initialize
    @hand = Hand.new
    @bank = Bank.new
    @bank.bet
  end

  def take_card
    @hand.user_take_card
    @hand.user_points
    @hand.dealer_take_card
    @hand.dealer_points
    open_cards
  end

  def open_cards
    @hand.user_points
    @hand.dealer_points
    puts "your cards #{@hand.user_cards}"
    puts "your points  #{@hand.user_points}"

    puts "deal cards #{@hand.dealer_cards}"
    puts "deal points #{@hand.dealer_points}"

    if @hand.user_points > 21 && @hand.dealer_points > 21
      @bank.draw
      puts 'draw'

    elsif @hand.user_points > 21
      @bank.dealer_win
      puts 'deal win'
      puts "your bank #{@bank.user_bank}"
      puts "deal bank #{@bank.dealer_bank}"
    elsif @hand.dealer_points > 21
      @bank.user_win
      puts 'user win'
      puts "your bank #{@bank.user_bank}"
      puts "deal bank #{@bank.dealer_bank}"
    elsif @hand.user_points > @hand.dealer_points
      @bank.user_win
      puts 'user win'
      puts "your bank #{@bank.user_bank}"
      puts "deal bank #{@bank.dealer_bank}"
    elsif @hand.user_points < @hand.dealer_points
      @bank.dealer_win
      puts 'deal win'
      puts "your bank #{@bank.user_bank}"
      puts "deal bank #{@bank.dealer_bank}"
    elsif @hand.dealer_points == @hand.user_points
      @bank.draw
      puts 'draw'
      puts "your bank #{@bank.user_bank}"
      puts "deal bank #{@bank.dealer_bank}"
    end

    if @bank.user_bank.zero?
      puts "Game over. #{@user_name} loose. Start new game? yes/no"
      start = gets.chomp
      if start == 'yes'
        Interface.new
      elsif start == 'no'
        abort
      end
    elsif @bank.dealer_bank.zero?
      puts 'Game over. Dealer loose. Start new game? yes/no'
      start = gets.chomp
      if start == 'yes'
        Interface.new
      elsif start == 'no'
        abort
      end
    end
  end

  def skip
    puts "#{@user_name} cards #{@hand.user_cards}"

    @hand.user_points

    puts "#{@user_name} points #{@hand.user_sum}"

    @hand.dealer_take_card

    if @hand.dealer_cards.length == 2
      puts 'dealer cards [* *]'
    elsif @hand.dealer_cards.length == 3
      puts 'dealer cards [* * *]'
    end
    puts "Take card - 1
          Open cards - 2
          Skip a move - 3"
    choose = gets.chomp.to_i

    case choose
      when 1
        take_card
      when 2
        open_cards
      when 3
        skip
    end
  end



end