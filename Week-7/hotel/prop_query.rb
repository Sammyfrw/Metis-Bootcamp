require "csv"
require "./property"

class PropertyQuery
  def initialize(filename)
    @file = filename
    @property = []
  end

  def begin_query
    read_file
    query_for_property
  end

  def read_file
    CSV.foreach(@file, headers: :true) do |row|
      @property << Property.new(row)
    end
  end

  def query_for_property
    print "Please input the hotel name that you wish details for. > "
    query = gets.chomp
    query_result = @property.detect {|property| property.name == query}
    show_result(query_result)
  end

  def show_result(query_result)
    puts query_result.name
  end
end

property_query = PropertyQuery.new('./hotels.csv')
property_query.begin_query