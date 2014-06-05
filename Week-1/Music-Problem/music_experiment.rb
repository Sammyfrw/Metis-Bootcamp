require "csv"

class MusicExperiment
	def initialize
		@songs = {}
	end

	def build_database
		CSV.foreach("music.csv", headers: true) do |row|
			if !@songs.key?(row["Artist"])
				@songs[row["Artist"]] = []
			end
			@songs[row["Artist"]] << row["Name"]
		end
	end

	def query
		print "Whose songs do you want listed? > "
		user_query = gets.chomp
		if !@songs.key?(user_query)
			puts "No artist with that name!"
		else
			puts @songs
		end

	end	
end

music_experiment = MusicExperiment.new
music_experiment.build_database
music_experiment.query
