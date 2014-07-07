class TagCloud

  def initialize
    @current_line = 0
    @current_book = 0
    @tag_array = []
    @tag_hash = {}
  end

  def read_file
		File.open("./tags.in", "r") do |file|
			#get number of scenarios
			@input_file = file.readlines
      set_book_number
      go_through_book
		end
 end

  def go_through_book
    set_tag_number
    read_book_tags
    display_book_tags
    next_book
  end

  def set_book_number
    @number_of_books = @input_file[@current_line].to_i
    @current_book += 1
    @current_line += 1
  end

  def set_tag_number
    @number_of_tags = @input_file[@current_line].to_i
  end

  def read_book_tags
    @tag_array << @input_file[@current_line += 1].upto(@number_of_tags)
    @current_line += @number_of_tags
    @tag_array.each do |word|
      if @tag_hash.has_key?(word.to_s)
        @tag_hash[word] += 1
      else
        @tag_hash[word] = 1
      end
    end
  end

  def display_book_tags
    puts "Book ##{@current_book}:"
    @tag_hash.each do |tag, count|
      puts "#{tag} : #{count}"
    puts
    end
  end

  def next_book
    if @current_book == @number_of_books
      puts "Completed file reading"
    else
      @current_book += 1
      go_through_book
    end
  end
  
end

tag_cloud = TagCloud.new  
tag_cloud.read_file