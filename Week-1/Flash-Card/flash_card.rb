class FlashCard 

	#Process is: 
	#Display/Ask Question
	#Get user prompt
	#Compare prompt to Question

	def initialize(question, answer) #Take Q and A as argument when class is made
		@question = question
		@answer = answer
		@response = ""
	end

	def play
		ask_question
		get_response
		if correct?
			right!
		else
			wrong!
		end
	end




	def ask_question
		puts question
		print "> "		
	end

	def get_response
		@response = $stdin.gets.chomp
	end


	def correct?
		@response == answer
	end

	def right!
			puts "Correct!"
	end
	
	def wrong!
			puts "Incorrect, the answer is #{answer}"
	end

	def question
		@question
	end

	def answer
		@answer
	end

	def response
		@response
	end

	def to_s
		"#{@question} / #{@answer}"
	end
end
