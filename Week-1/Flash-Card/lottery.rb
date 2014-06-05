class Lottery
	
	def initialize
		@name_pool = Array.new
	end

	#input names
	#end input when nothing is entered with enter
	#shuffle names
	#pick winning names

	def lotto
		welcome
		name_entry
		name_shuffle
		pick_winner
	end

private

	def welcome
		puts "Welcome to the lottery by The Raining Whisker!"
		puts "Enter names that are entering the lottery. Finish by pressing enter with no name pressed."
		print "> "
	end

	def name_entry
		loop do 
			entry = gets.chomp
			if entry.empty?	
				break
			else
			puts "#{entry} entered into the lottery. Next name, please!"
			@name_pool << entry 		
			end
		end
	end

	# def name_shuffle
	# 	puts "Our lottery contestants are..."
	# 	puts @name_pool
	# 	@name_pool = @name_pool.shuffle
	# 	puts "Shuffling the lottery pool!"
	# end

	def pick_winner
		print "And the winner is..."
		print "#{@name_pool.sample!} Congratulations!"
	end
end

Lottery.new.lotto
