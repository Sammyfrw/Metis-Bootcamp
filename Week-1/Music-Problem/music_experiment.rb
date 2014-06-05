require "csv"

class JukeBox
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


	def build_jukebox
		CSV.foreach("music.csv", headers: true) do |row|
			if !@music_database.key?(row["Artist"])
				@music_database[row["Artist"]] = []
			end
			@music_database[row["Artist"]] << row["Name"]
		end
	end

	
	end	
end

class MusicQuery


def query


music_experiment = JukeBox.new
music_experiment.build_jukebox
music_experiment.query
