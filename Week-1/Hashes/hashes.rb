class MyHash
	def initialize
		@pairs = []
	end

	def []=(key, value)
		matching_pair = find_pair(key)
		if matching_pair
			matching_pair.value = value
		else
			@pairs << Pair.new(key, value)
		end
	end

	def inspect 
		"{#{@pairs.join(", ")}}"
	end


	def find_pair(key)
		@pairs.find { |pair| pair.key == key }
	end

	def [](key)
		matching_pair = find_pair(key)
		if matching_pair
			matching_pair.value
		end
	end
end

class Pair

	attr_reader :key
	attr_reader :value
	attr_writer :value

	def initialize(key, value)
		@key = key
		@value = value
	end

	def to_s
		"#{@key.inspect} => #{@value.inspect}"
	end



end

hash = MyHash.new
hash["Apples"] = "Sweet"
hash["Apples"]
# puts hash2
