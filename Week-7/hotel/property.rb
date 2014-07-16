class Property
  def initialize(details)
    @property_details = details
  end

  def name
    @property_details["Hotel"]
  end

  def city
    @property_details["City"]
  end

  def phone
    @property_details["Phone Number"]
  end

  def rooms
    @property_details["Number of Singles"] + @property_details["Number of Doubles"]
  end
end