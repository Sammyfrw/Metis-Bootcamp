# Imagine a school that has 100 closed lockers and 100 students standing in
# line. The 1st student goes through and opens every locker, the 2nd student
# closes every 2nd locker, and the 3rd student toggles every 3rd locker. If
# the remaining students go through, likewise, and toggle the state of any
# locker that is a multiple of their number in line, what lockers are open at
# the end?

# Print locker numbers from 1-100, as well as its final state ("open" or
# "closed"). For example:

# #100 lockers, all closed
# 100 students
### x+1 student opens each x+1 locker
#1st student, pings every locker.
#2nd student, pings every 2nd locker.



lockers_hall = [false] * 100


# until current_student == 100
# 	until current_locker == 100
# 		if current_locker % current_student == 0
# 			lockers_hall[current_locker-1] = !locker
# 			current_locker += 1
# 			# print current_locker
# 		end
# 	end
# 	current_student += 1
# 	current_locker = 0
# end

# print locker

NUM_LOCKERS = 100
NUM_STUDENTS = 100

1.upto(NUM_STUDENTS) do |student|
	1.upto(NUM_LOCKERS) do |locker|
		if locker % student== 0
			lockers_hall[locker-1] = !lockers_hall[locker-1]
		end
	end
end

lockers_hall.each_with_index { |item, index| 
	print "Locker number #{index+1} is " 
	if item
		puts "Open"
	else
		puts "Closed"
	end
}
