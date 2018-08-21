require 'spec_helper'
require 'faker'
require 'loader'

RSpec.describe Loader do
  let(:image) do
    double(
      'Data',
      gps_latitude: Faker::Number.number,
      gps_longitude: Faker::Number.number
    )
  end

  let(:extractor) { double('Exif', new: image) }

  subject do
    Loader.new(
      path: 'spec/data',
      extractor: extractor
    )
  end

  describe '#images' do
    context 'load all image files from a path' do
      it 'return an array of Image class' do
        images = subject.images

        expect(images).to be_an Array
        expect(images.length).to eq 2
        expect(images.first).to be_an Image
        expect(images.first.name).to eq 'image_a.jpg'
        expect(images.last).to be_an Image
        expect(images.last.name).to eq 'image_e.jpg'
      end
    end
  end
end
