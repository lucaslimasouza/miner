require 'spec_helper'

RSpec.describe Loader do
  subject(:product) {
    Image.new(
      name: Faker::File.file_name('data','image','jpg') ,
      latitude: Faker::Number.number,
      longitude: Faker::Number.number)
    }

end
