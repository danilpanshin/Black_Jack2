require_relative 'player'
require_relative 'dealer'
require_relative 'hand'
require_relative 'deck'
require_relative 'card'

class Game
  attr_reader :player, :dealer

  def initialize
    @deck = Deck.new
    @player = Player.new(@deck)
    @dealer = Dealer.new(@deck)
  end

  def new_game
    clear_hands
    2.times { player.hand.add_card }
    2.times { dealer.hand.add_card }
    bet
  end

  def show_cards(player)
    player.hand.cards
  end

  def show_score(player)
    player.hand.count_score
  end

  def player_take_card
    return true if player.hand.cards.size > 2
    player.hand.add_card
    false
  end

  def who_win
    dealer_score = dealer.hand.count_score
    player_score = player.hand.count_score
    if player_score > dealer_score
      if player_score < 22
        player
      else
        dealer
      end
    elsif player_score < dealer_score
      if dealer_score > 21
        player
      else
        dealer
      end
    end
  end

  def stack
    winner = who_win
    if winner == player
      player.win
    elsif winner == dealer
      dealer.win
    else
      player.draw
      dealer.draw
    end
    player.stack
  end

  private

  def bet
    player.bet
    dealer.bet
  end

  def clear_hands
    player.hand.clear
    dealer.hand.clear
  end
end