#Query artist
#### Load the CSV document
#### Lookup the artist 
#print all songs by artist

require "./tracks.rb"


class MusicQuery
	def initialize

	end

	def query
		print "Whose songs do you want listed? > "
		user_query = gets.chomp
		# lookup(user_query)

	end	
end

tracks = Tracks.new("music.csv")
music_query = MusicQuery.new(tracks.lookup)