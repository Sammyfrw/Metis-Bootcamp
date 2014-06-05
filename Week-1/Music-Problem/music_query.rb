
class MusicQuery

	def initialize
		@music_database = {}
	end

	def play
		loop do
			print "Whose songs do you want listed? > "
			artist_name = prompt_artist_name
			if !@music_database.key?(artist_name)
				puts "No artist with that name!"
			else
				puts @music_database[artist_name]
			end
		end
	end

end