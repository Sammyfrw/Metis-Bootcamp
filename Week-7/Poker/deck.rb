class Deck
  SUITS = ["H", "D", "S", "C"]
  NUMBERS = ["A", ('2'..'9').to_a, "T", "J", "Q", "K"].flatten

  attr_reader :deck, :suits, :numbers
  
  def initialize
    @deck = []
  end


  def populate_deck
    make_decks
    shuffle_deck
  end

  def shift(num)
    deck.shift(num)
  end
  
  private

  def make_decks
    deck = add_numbers.flatten
  end

  def add_numbers
    SUITS.each do |suit| 
      NUMBERS.each do |number|   
        deck << number + suit
      end
    end
  end

  def shuffle_deck
    deck.shuffle!
  end

end
