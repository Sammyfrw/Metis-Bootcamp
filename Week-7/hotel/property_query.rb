require "./null_property"
require "./property_reader"

class PropertyQuery
  def initialize(properties)
    @properties = properties
  end

  def new_query
    query_for_property
  end

  private

  def query_for_property
    print "Please input the hotel name that you wish details for. > "
    query = gets.chomp
    find_result(query)
  end

  def find_result(query)
    property = @properties.detect {|property| property.name == query} || property = NullProperty.new
    property.display
    query_for_property
  end
end

property_reader = PropertyReader.new('./hotels.csv')
property_reader.read_file
property_query = PropertyQuery.new(property_reader.properties)
property_query.new_query