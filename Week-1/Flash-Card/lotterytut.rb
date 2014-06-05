class Lottery
	def initialize
		@entry = ""
		@name_pool = Array.new
	end

	#input names
	#end input when nothing is entered with enter
	#shuffle names
	#pick winning names

	def lottery
		welcome
		name_entry
		if finish?
			name_shuffle
		end
		pick_winner
	end




	def welcome
		puts "Welcome to the lottery by The Raining Whisker!"
		puts "Enter names that are entering the lottery. Finish by pressing enter with no name pressed."

	end

	def name_entry
		@entry = gets.chomp
		if @entry == ""
		else
			puts "#{@entry} entered into the lottery. Next name, please!"
			@name_pool.push(@entry)
			name_entry
		
		end
	end

	def name_shuffle
		@name_pool.shuffle
		puts "Shuffling the lottery pool!"
	end

	def pick_winner
		print "And the winner is..."
		print "#{@name_pool[0]}! Congratulations!"
	end


	def finish?
		@entry == ""
	end
end

lottery = Lottery.new
lottery.lottery

entry = gets.chomp
