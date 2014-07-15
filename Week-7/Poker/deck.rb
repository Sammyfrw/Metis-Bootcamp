class Deck
  SUITS = ["H", "D", "S", "C"]
  NUMBERS = ["A", ('2'..'9').to_a, "T", "J", "Q", "K"].flatten

  def initialize
    @deck = []
    @deck = populate_deck
  end

  def shift(num)
    @deck.shift(num)
  end
  
  private

  def populate_deck
    make_decks
    shuffle_deck
  end

  def make_decks
    SUITS.each do |suit| 
      NUMBERS.each do |number|   
        @deck << number + suit
      end
    end
  end

  def shuffle_deck
    @deck.shuffle!
  end

end
