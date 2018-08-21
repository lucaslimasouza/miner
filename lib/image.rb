class Image

  attr_reader :name, :latitude, :longitude

  def initialize(name:, latitude:, longitude:)
    @name = name
    @latitude = latitude
    @longitude = longitude
  end

end
