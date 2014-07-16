require "csv"
require "./property"
require "./null_property"

class PropertyQuery
  def initialize(filename)
    @file = filename
    @properties = []
  end

  def new_query
    read_file
    query_for_property
  end

  private

  def read_file
    CSV.foreach(@file, headers: :true) do |row|
      @properties << Property.new(row)
    end
  end

  def query_for_property
    print "Please input the hotel name that you wish details for. > "
    query = gets.chomp
    find_result(query)
  end

  def find_result(query)
    property = @properties.detect {|property| property.name == query} || property = NullProperty.new
    property.display_result
    query_for_property
  end
end


property_query = PropertyQuery.new('./hotels.csv')
property_query.new_query