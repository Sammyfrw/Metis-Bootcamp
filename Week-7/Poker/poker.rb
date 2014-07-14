require "./deck"

class Poker
  def initialize(players)
    @players = players
    @player_hands = [[]] * @players
  end

  def play_game
    if players < 10
      distribute_cards
      print_hands
      # display_winner
    else
      print "Too many players. Unable to start game."
    end
  end

  attr_reader :deck, :players, :player_hands

  private

 

  def distribute_cards
    deck = Deck.new
    deck.new_deck
    player_hands.map do |hand|
      hand << deck.shift(5)
    end
  end

  def print_hands
    player_hands.each_with_index do |hands, index|
        puts "Player #{index+1}:"
        puts "----------"
        puts hands[index]
    end
  end

  def display_winner
  end
end

poker = Poker.new(4)
poker.play_game