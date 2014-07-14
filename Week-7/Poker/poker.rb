require "./deck"

class Poker
  MAX_PLAYERS = 10

  def initialize(number_of_players)
    @players = number_of_players
    @player_hands = @players.times.map { [] }
  end

  def play_game
    if players < MAX_PLAYERS
      distribute_cards
      print_hands
      # display_winner
    else
      puts "Too many players. Unable to start game."
    end
  end

  attr_reader :deck, :players, :player_hands

  private 

  def distribute_cards
    deck = Deck.new
    deck.populate_deck
    player_hands.map do |hand|
      hand << deck.shift(5)
    end
  end

  def print_hands
    player_hands.each_with_index do |hands, index|
        hands_message = "Player #{index+1} : "
        puts hands_message
        puts "-" * hands_message.length
        puts hands
    end
  end

  def display_best_hands(hands)
    
  end
end

poker = Poker.new(4)
poker.play_game