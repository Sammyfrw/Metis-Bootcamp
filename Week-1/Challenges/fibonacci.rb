class Fibonacci
	def initialize
		@num_interim = 0
		@total_sum = 0
		@num_1 = 1
		@num_2 = 2
	end

	def fib_sequence(limit)

		until @num_interim >= limit
			@num_interim = @num_1 + @num_2
			@num_1 = @num_2
			@num_2 = @num_interim
			seq_check
		end
		puts @total_sum
	end
	
	def seq_check
		if @num_interim % 2 == 0
			@total_sum += @num_interim
		end
	end
end 

wombat = Fibonacci.new
wombat.fib_sequence(4000000)