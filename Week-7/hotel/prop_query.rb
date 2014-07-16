require 'csv'
require "./hotel"

class PropQuery
  def initialize
    @property_database = {}
  end

  def run_app
    read_file
    construct_database
    prompt_for_property
  end

  def read_file(filename)
    CSV.foreach(filename, :headers => true, :converters => :all) do |row|
      property = Hotel.new(row)
      puts property.hotel
    end
  end
end

hotel = PropQuery.new
hotel.read_file('./hotels.csv')