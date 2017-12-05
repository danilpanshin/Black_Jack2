require_relative 'game'

class Interface

  def initialize

    puts "Enter your name"
    @user_name = gets.chomp
    start
  end

  def start
    @game = Game.new

    puts "your cards #{@game.hand.user_cards}"
    puts "your points #{@game.hand.user_points}"
    puts "dealer cards [* *]"

    puts "Take card - 1
          Open cards - 2
          Skip a move - 3"
    choose = gets.chomp.to_i

    case choose
      when 1
        @game.take_card
      when 2
        @game.open_cards
      when 3
        @game.skip

    end

    puts 'once more? yes/no'
    more = gets.chomp

    start if more == 'yes'
  end
end