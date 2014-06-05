require "./tracks"

class MusicQuery

	def initialize(tracks)
		@music_database = tracks
	end

	def play
		loop do
			ask_query
			artist_name = gets.chomp
			if artist_name.empty?
				break
			end
			print_artist(artist_name)
		end
	end

	def print_artist(artist_name)
		if !@music_database.key?(artist_name)
			puts "No artist with that name!"
		else
			pretty_print(artist_name)
		end
	end

	def ask_query
		puts "Enter an artist name. To exit, enter a blank query."
		print "Whose songs do you want listed? > "
	end

	def pretty_print(artist_name)
		puts "*" * (artist_name.length)
		puts artist_name
		puts "*" * (artist_name.length)
		puts @music_database[artist_name].sort
	end
end

tracks = Tracks.new("music.csv")
tracks = tracks.read
query = MusicQuery.new(tracks)
query.play
