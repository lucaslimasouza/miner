class Image

  attr_reader :name, :latitude, :longitude

  def initialize(name:, latitude:, longitude:)
    @name = name
    @latitude = latitude
    @longitude = longitude
  end

  def to_csv
    [@name, @latitude, @longitude]
  end

end
