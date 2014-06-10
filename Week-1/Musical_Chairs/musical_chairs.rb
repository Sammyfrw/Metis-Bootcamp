# This version of musical chairs may be longer than necessary, due to trying to work it out with objects.

class MusicalChairs
def initialize(filename)
	@filename = filename
	@round_number = 1
end

def play
	import_data
	run_game
end

def import_data
	@game_data = File.open("./chairs.in.txt", "r")	
end

def run_game
	File.open("./musical_chairs_scores.txt", "w") do |file| 
		@game_data.each_line do |line|
			split_data(line)
			find_eliminations
			elimination_msg = "Round ##{@round_number}: #{@results} children eliminated." + "\n"
			file.write elimination_msg
		end
		
		@round_number += 1
	end
end

def find_eliminations
		@results = @kids - @chairs
end

def split_data(line)
	kids_and_chairs = line.split(" ")
	@chairs = kids_and_chairs[1].to_i
	@kids = kids_and_chairs[0].to_i
end

end

musical_chairs = MusicalChairs.new("./chairs.in.txt")
musical_chairs.play
