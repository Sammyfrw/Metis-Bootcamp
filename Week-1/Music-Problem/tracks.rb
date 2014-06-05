require "csv"
# require "./music_query.rb"

class Tracks
	def initialize(filename)
		@filename = filename
	end

	def lookup#(user_query)
		songs =[]

		CSV.foreach(@filename, headers:true) do |row|
			songs << MusicQuery.new(row["Artist"], row["Name"]) 
		end
		songs
	end

end

# class MusicQuery
# 	def initialize

# 	end

# 	def query
# 		print "Whose songs do you want listed? > "
# 		#  user_query = gets.chomp
# 		# lookup(user_query)

# 	end	
# end

# tracks = Tracks.new("music.csv")
# music_query = MusicQuery.new(tracks.lookup)