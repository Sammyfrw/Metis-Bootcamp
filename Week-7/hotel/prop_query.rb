require 'csv'
require "./property"

class PropertyQuery
  def initialize
  end

  def read_file(filename)
    CSV.foreach(filename, headers: :true) do |row|
      property = Property.new(row)
      puts property.name
    end
  end
end

property_query = PropertyQuery.new
property_query.read_file('./hotels.csv')