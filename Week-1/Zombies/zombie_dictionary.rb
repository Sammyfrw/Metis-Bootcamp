class ZombieDictionary
	def initialize#(filename)
		#@filename = filename
		@currentline = 0
		@current_scenario = 0
		@scenario = 0
		@word_number = 0
		@garble_number = 0
		@dict_words = []
		@zombie_garble = []
	end

	def read_file
		File.open("./zombies.in", "r") do |file|
			#get number of scenarios
			@input_file = file.readlines
			set_scenario_number
			scenario_loop(file)
			puts "Currentline is now #{@currentline}"
		end
	end

	def set_scenario_number
		get_line.to_i
		@scenario = get_line.to_i
		@current_scenario += 1
		@currentline += 1
		puts "Scenario number set to #{@scenario}"
		# @scenario = @line_content

	end

	def scenario_loop(file)
		until @current_scenario == @scenario
			if @word_number == 0 
				set_number_words
			elsif @garble_number == 0
				set_number_garble
			else
				next_scenario
			end
		end
	end

	def set_number_words
		@word_number = get_line.to_i
		puts "Word number set to #{@word_number}"
		@currentline += 1
		@word_number.times do
		insert_dictionary_word
		end
	end

	def get_line
		@line_content = @input_file[@currentline]
	end

	def insert_dictionary_word
		get_line
		@dict_words << @line_content	
		@currentline += 1
	end

	def set_number_garble
		@garble_number = get_line.to_i
		puts "Garble Number set to #{@garble_number}"
		@currentline += 1
		@garble_number.times do
		insert_garble_word
		end
	end

	def insert_garble_word
		get_line
		@zombie_garble << @line_content
		@currentline += 1
	end	


	def next_scenario
		@current_scenario += 1
		@word_number = 0
		@garble_number = 0
		translate_garble
		@dict_words = []
		@zombie_garble = []
		print "NEW SCENARIO!"
		gets.chomp
	end

	def translate_garble
		@zombie_garble.each do |garble|
			@dict_words.each do |word|
				letters = word.split(//)
				if garble.include?(letters)
				# word.each_char do |letter| 
					# if garble.include?(letter)
						puts	"Did you mean: #{word.chomp}?"
						# break
					else
						puts "No matches found."
					end
				# end
			end
		end
	end


end

fie = ZombieDictionary.new#("./zombie_dictionary.rb")
fie.read_file


