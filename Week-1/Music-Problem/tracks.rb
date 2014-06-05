require "csv"
require "pp"

class Tracks
	def initialize(file_name)
		@file_name = file_name
		@music = {}

	end

	def read
		CSV.foreach(@file_name, :headers => true) do |row|
			song_name = row ["Name"]
			artist_name = row ["Artist"]
			set_new_artist
			@music[artist_name] << song_name
		end
		@music
	end

	def set_new_artist
		if !@music.key?(artist_name)
			@music[artist_name] = []
		end
	end
end

tracks = Tracks.new("music.csv")
result = tracks.read
pp result