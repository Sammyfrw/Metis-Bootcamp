require "csv"
require "./flash_card"

class CardReader
	def initialize(filename)
		@filename = filename
	end

	def cards
		cards =[]
		CSV.foreach(@filename, headers: true) do |row|
			cards << FlashCard.new(row["Question"], row["Answer"])
			
		end
		cards
	end

end
