require "csv"
require "./property"

class PropertyReader
  attr_reader :properties

  def initialize(filename)
   @file = filename
   @properties = []
  end

  def read_file
    CSV.foreach(@file, headers: :true) do |row|
      @properties << Property.new(row)
    end
  end
end