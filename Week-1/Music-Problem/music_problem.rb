#Query artist
#### Load the CSV document
#### Lookup the artist 
#print all songs by artist

require "csv"

class Tracks
	def initialize(filename)
		@filename = filename
	end

	def lookup
		songs =[]

		CSV.foreach(@filename, headers:true) do |row|
			songs << 
		
	end

end

class MusicQuery
	def initialize

	end

	def query
		print "Whose songs do you want listed? > "
		user_query = gets.chomp
		lookup(user_query)

	end	
end