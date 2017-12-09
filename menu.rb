require_relative 'game'

class Menu
  attr_reader :game, :name

  def initialize
    @name = user_name
    @game = Game.new
  end

  def interface
    loop do
      game.new_game
      show_hand_and_score(game.player)
      player_move
      show_winner
      show_stack
      break if new_game_or_exit?
    end
  end

  private

  def user_name
    puts 'Enter your name: '
    gets.chomp
  end

  def show_hand_and_score(player)
    print player == game.player ? "#{name}'s cards: " : "dealer's cards: "
    game.show_cards(player).each { |card| print "#{card.nums}#{card.suits}, " }
    puts "score: #{game.show_score(player)}"
    #puts "dealers's cards * * "
  end

  def player_move
    loop do
      case user_move_menu
        when 1
          puts dealer_move_result
        when 2
          if game.player_take_card
            puts 'You have 3 cards already'
            open_cards
            break
          else
            show_hand_and_score(game.player)
            game.dealer.move
            puts dealer_move_result
          end
        when 3
          open_cards
          break
      end
    end
  end

  def dealer_move_result
    return 'Dealer took card, your move:' if game.dealer.move
    'Dealer missed move, your move:'
  end

  def user_move_menu
    puts ''
    puts 'Choose action:'
    puts 'skip a move - 1'
    puts 'take card - 2'
    puts 'open cards - 3'
    gets.chomp.to_i
  end

  def open_cards
    puts ''
    show_hand_and_score(game.dealer)
    show_hand_and_score(game.player)
  end

  def show_winner
    puts ''
    winner = game.who_win
    if winner == game.player
      puts "#{name}, you won!"
    elsif winner == game.dealer
      puts "#{name}, you loose."
    else
      'Draw.'
    end
  end

  def show_stack
    puts "#{name}, your stack is #{game.stack}"
    puts "dealer stack is #{game.dealer.stack}"
  end

  def new_game_or_exit?
    puts ''
    puts 'Continue game: y/n?'
    return false if gets.chomp == 'y'
    true
  end
end

m = Menu.new
m.interface