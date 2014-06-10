#Load up the input file with words
### Look up number of scenarios (m)
### Each scenario has a dictionary n followed by n words.
### Each scenario has a number o for the number of zombie words to be looked up followed by o words
### All words are in uppercase.
### Then it repeats (n dictionary words, followed by o words to look up) per scenario

#look up dictionary to see if words on that line match dictionary
### Look for runs where a letter occurs once/more next to each other
### Words can have multiple runs of the same letter.
### A word matches if they have the same letters in their runs.

#print correct word for that line w/ phrase
###Print header Scenario #i with i = scenario number.
###For each word in scenario if any match print Did you mean: followed by match with ? at end
###If no match print No matches found. 
###Print new line after.


#output to .txt file


###Each scenario will have an array of words within it 
# class ZombieGarble
# 	def initialize(filename)
# 		@filename = filename
# 		@scenario_dictionary = []
# 		@scenario_number = 0
# 		@dictionary_terms = 0
# 		@zombie_words = []

# 	end

# 	def translate
# 		build_dictionary
# 		read_garble
# 		zom_dictionary
# 		export_translation
# 	end


# 	def build_dictionary
# 		@words = File.open("./zombies.in") do |file|
# 			@words.each_line do |file|
# 				if file.is_a? Integer
# 					@dictionary_terms = file
# 					@scenario_dictionary = []
# 					# @scenario_dictionary << "" * file
# 				else
# 					@scenario_dictionary << file
# 				end
# 			end

# 	end

# 	def zom_dictionary
# 		File.open("./translated_zombies.txt", "w") do |file|
# 			@garble.each_line do |line|
# 				letter_check(line)
# 				if line.include? "B"
# 	end

# 	def letter_check(word)
# 		if word.include? "B"

# end



