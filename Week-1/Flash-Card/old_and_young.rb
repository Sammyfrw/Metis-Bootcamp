class List
#welcome
#input names and age (make sure age is numerical)
#display list
#print oldest 
#print youngest
	def initialize
		@name_entry = ""
		@age_entry = ""
		@entry_list = {}
	end


	def agelist
		welcome
		entry_input
		display_input
		print_names
	end

	def welcome
		puts "Hello! Please enter name, followed by age. End entry by inputting a blank name."
	end

	def entry_input
		loop do
			print "Please enter a name. > "
			@name_entry = gets.chomp
			if @name_entry == ""
				break
			end
			puts ""
			print "Please enter this person's age. > "
			@age_entry = gets.chomp
			if @age_entry.is_a? Integer
				@entry_list[@name_entry] = @age_entry
			else
				puts "Please input a number."
			end
		end
	end

	def display_input
		puts "The following names are on the list:"
		puts @entry_list
	end

	def print_names
		@entry_list = @entry_list.sort_by {|name, age| age}
		puts "The oldest in the list is: #{@entry_list.last}."
		puts "The youngest in the list is : #{@entry_list.last}"
	end


end

list = List.new
list.agelist
