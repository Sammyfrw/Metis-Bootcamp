require "csv"
require "./property"

class PropertyQuery
  def initialize(filename)
    @file = filename
  end

  def read_file
    CSV.foreach(@file, headers: :true) do |row|
      property = Property.new(row)
      puts property.name
    end
  end
end

property_query = PropertyQuery.new('./hotels.csv')
property_query.read_file