# # Hashes and the key/values of the hash often behave very differently. Keep in
# # mind that the keys and values might not be hashes themselves, so pointing or
# # executing commands on those will result in commands specific to the class of
# # whatever element is pointed at. Hashes should have key-value pairs with a
# # similar type (strings key, array value) instead of different types of key-
# # value pairs.


# # When a hash is the last argument in a method, you can leave behind the curly
# brackets. #The foreach method takes 2 arguments. foreach is called on CSV as a
# way to read through a CSV file; and the argument is the filename (music.csv),
# and then options that we need. For example:

CSV.foreach(@filename, :headers => true) do |row| 
	end

#In this instance, the method will take in the row item in the column
# (referred in the pipe argument) and read it and parse it into the command
# for each row. For example, if you had 2 columns labelled weapon and attack,
# # it would read each row in the CSV under weapon and attack columns and process
# # the method described in do.

#We can check if a particular key exists in a hash with a .key?(key) argument.
#music.key?(artist_name) will check if artist_name is a key in the hash music.
#We can check if a key is NOT in there with !music.key?(artist_name).
