require 'exif'
require_relative 'image'

class Loader
  def initialize(path: '', extractor:)
    @path = "#{path}**/*.{jpg,JPG}"
    @extractor = extractor
  end

  def images
    files = Dir.glob(@path)
    files.map { |file| image_from file }
  rescue Exception => e
    puts 'Error on load images'
  end

  private

  def image_from(file)
    image_attributes = { name: split_file_name(file) }
    begin
      data = @extractor.new(File.open(file))
      image_attributes[:latitude] = data.gps_latitude
      image_attributes[:longitude] = data.gps_longitude
    rescue Exception => e
      puts "#{file} #{e}"
    end
    Image.new(image_attributes)
  end

  def split_file_name(file)
    file.split('/').last
  end
end
