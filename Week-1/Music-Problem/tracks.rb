require "csv"
require "pp"

class Tracks
	def initialize(file_name)
		@file_name = file_name
		@music_database = {}

	end

	def read
		CSV.foreach(@file_name, :headers => true) do |row|
			song_name = row ["Name"]
			artist_name = row ["Artist"]
			set_new_artist(artist_name)
			@music_database[artist_name] << song_name
		end
		@music_database
	end

	def set_new_artist(artist_name)
		if !@music_database.key?(artist_name)
			@music_database[artist_name] = []
		end
	end
end

