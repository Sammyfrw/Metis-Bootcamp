require "./null_property"
require "./property_reader"

class PropertyQuery
  def initialize(properties)
    @properties = properties
    @property = ""
  end

  def ask_user_for_query
    loop do 
      property = query_for_property
      property.display
    end
  end

  private

  def query_for_property
    print "Please input the hotel name that you wish details for. > "
    query = gets.chomp
    find_result(query)
  end

  def find_result(query)
    @properties.detect { |property| property.name == query } || NullProperty.new
  end
end

property_reader = PropertyReader.new('./hotels.csv')
property_reader.read_file
property_query = PropertyQuery.new(property_reader.properties)
property_query.ask_user_for_query