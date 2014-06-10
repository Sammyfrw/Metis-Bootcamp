def sum_up
	sum = 0
	1.upto(1000) do |i|
		if i % 15 == 0
		sum += i
		end
	end
	puts sum
end

sum_up