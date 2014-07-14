class Deck
  def initialize
    @deck = []
    @suits = ["H", "D", "S", "C"]
    @numbers = ["A", ('2'..'9').to_a, "T", "J", "Q", "K"].flatten
  end

  attr_reader :deck, :suits, :numbers

  def new_deck
    make_decks
    add_numbers
    shuffle_deck
    return deck
  end

  def shift(num)
    deck.shift(num)
  end
  
  private

  def make_decks
    deck = add_numbers
    deck.flatten
  end

  def add_numbers
    suits.map do |suit| 
      numbers.each do |number|   
        deck << number + suit
      end
    end
  end

  def shuffle_deck
    deck.shuffle!
  end

end
