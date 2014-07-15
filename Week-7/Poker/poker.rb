require "./deck"

class Poker
  MAX_PLAYERS = 10
  MAX_CARDS_PER_HAND = 5

  attr_reader :deck, :players, :player_hands

  def initialize(number_of_players)
    @players = number_of_players
    @player_hands = @players.times.map { [] }
  end

  def play_game
    if players <= MAX_PLAYERS
      distribute_cards
      print_hands
      # display_winner
    else
      puts "Too many players. Unable to start game."
    end
  end

  private 

  def distribute_cards
    deck = Deck.new
    player_hands.map! { deck.shift(MAX_CARDS_PER_HAND) } 
  end

  def print_hands
    player_hands.each_with_index do |hands, index|
      hands_message = "Player #{index + 1} : "
      divider = "-" * hands_message.length
      puts hands_message + "\n" + divider
      puts hands
    end
  end

  def get_hand_value(hand)
    hand.each do |card|
      card.split("") 
    end
  end

  def display_best_hands(hands)
  end
end

poker = Poker.new(4)
poker.play_game