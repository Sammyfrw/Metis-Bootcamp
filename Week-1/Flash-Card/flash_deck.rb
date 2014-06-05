require "./flash_card.rb"
require "./card_reader.rb"

class FlashDeck

	def initialize(deck)
		shuffled_deck = deck.shuffle
		@deck = shuffled_deck
	end

	def play
		@deck.each do |card|
			card.play
		end
	end


	def showdeck
	 @deck.each do |card|
			card.to_s
			puts card
		end


	end

end

# card_a = FlashCard.new("What does Bonjour mean?", "Good Day!")
# card_b = FlashCard.new("What does Guten Morgen mean?", "Good Morning!")
# card_c = FlashCard.new("What does Konbanwa mean?", "Good Evening!")


# card_a = ["What does Bonjour mean?", "Good Day!"]
# card_b = ["What does Guten Morgen mean?", "Good Morning!"]
# card_c = ["What does Konbanwa mean?", "Good Evening!"]

# base_deck = [card_a, card_b, card_c]

card_reader = CardReader.new("cards.csv")


flashtrivia = FlashDeck.new(card_reader.cards)
flashtrivia.play

