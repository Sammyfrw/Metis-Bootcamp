require "csv"
require "./property"

class PropertyQuery
  def initialize(filename)
    @file = filename
    @properties = []
  end

  def run_query_app
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
    property = @properties.detect {|property| property.name == query}
    show_result(property)
  end

  def show_result(property)
    puts property.name
  end
end

property_query = PropertyQuery.new('./hotels.csv')
property_query.run_query_app