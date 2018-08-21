require 'image'

class Loader
  def initialize(path: '', extractor:)
    @path = "#{path}/**/*{jpg,JPG}"
    @extractor = extractor
  end

  def images
    files = Dir.glob(@path)
    files.map { |file| image_from file }
  end

  private

  def image_from(file)
    data = @extractor.new(file)
    Image.new(
      name: split_file_name(file),
      latitude: data.gps_latitude,
      longitude: data.gps_longitude
    )
  end

  def split_file_name(file)
    file.split('/').last
  end
end
