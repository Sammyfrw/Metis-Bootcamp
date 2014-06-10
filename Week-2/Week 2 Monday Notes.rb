# Calling to_a on a File type will turn it into an array of lines.

# Using .map on an array (it has a do/end with args), will output the return
# value of what it is iterating. Without a bang, it will not mutate whatever
# it is iterating. Using the musical chairs example:

def run
	@input.to_a.each_with_index do |line, index|
		students_and_chairs = line.split(" ")
		students = students_and_chairs.first.to_i
		chairs = students_and_chairs.last.to_i
	end

# This can be simplified to:

def run
	@input.to_a.each_with_index do |line, index|
		students, chairs = line.split(" ").map {|element| element.to_i}
	@output.puts "Round #{index + 1}: #{eliminated_students} students eliminated."
	end
end

# This makes an array containing [array item 1,array item 2] for the current
# line being processed by each_with_index, and assigns them to the variables
# students and chairs. The block in .map can actually be simplified if it's
# straightforward:

students, chairs = line.split(" ").map(&:to_i)

# In this instance, the one-line block of element argument in the block having
# a method called on it is able to be simplified to &:methodname.

=================================================

# How do we store data if we have TONS and TONS of data?

# In databases, primary keys are column/columns in a table that uniquely
# identify specific records. (This is akin to a unique ID). We can actually
# generate these automatically if we wanted to, to make things easy. Unique,
# auto incrementing keys. We can then refer to these keys on other tables;
# these are foreign keys.

# Tables are collections of data arranged in rows and columns. It's a
# relational form of data. We can remove and add columns and rows on tables.
# It allows users to also be able to arrange, look up and input data.

# Using SQL: There's a variety of commands you can use in SQL:  SELECT: tells
# which attribute (columns) we'll be taking. Select (FROM): where the filter
# begins in terms of columns. Select (order by): sort by a particular filter
# (column) default is descending (DESC) but can also ascend (ASC). LIMIT also
# allows reducing the amount of results given. Whatever is selected, will be
# returned,.

# e.g. SELECT id name FROM images WHERE gallery_id = 1 ORDER BY name DESC

# Order of these subcommands roughly matters. Select always comes before from,
# which comes before Where, etc.
#
# Adjoin will allow you to join two tables together, and make queries on them.

SELECT galleries.name, images.name  #these two are from different tables.
FROM galleries
JOIN images #now we need to specify what we need to join them on.
ON galleries.id = images.gallery_id #they are now joined by these columns.

# GROUP BY function allows usage of aggregate functions that are made up of
# two or parameters in SELECT (by ID column + AVG functions, etc.) Thus:

SELECT galleries.id, AVG(images.likes)
FROM galleries
JOIN images
ON galleries.id = images.gallery_id;
GROUP BY galleries.id;

#Will allow you to group the different gallery IDs with each returning the
#average likes of each.

# Similarly if SELECT chose galleries.id MAX(images.id), it would choose the
# # largest image ID in each gallery.


