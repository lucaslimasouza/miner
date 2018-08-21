require 'spec_helper'
require 'faker'
require 'image'

RSpec.describe Image do
  subject(:product) {
    Image.new(
      name: Faker::File.file_name('data','image','jpg') ,
      latitude: Faker::Number.number,
      longitude: Faker::Number.number)
    }

  describe '#name' do
    it "return the name's value" do
      expect(subject.name).not_to be_nil
    end
  end

  describe '#latitude' do
    it "return the latitude's value" do
      expect(subject.latitude).not_to be_nil
    end
  end

  describe '#longitude' do
    it "return the longitude's value" do
      expect(subject.longitude).not_to be_nil
    end
  end

  describe '#to_csv' do
    it "return an array with image's name, latitude and longitude" do
      csv_row = subject.to_csv

      expect(csv_row).to be_an Array
      expect(csv_row.length).to eq 3
      expect(csv_row.first).to eq subject.name
      expect(csv_row[1]).to eq subject.latitude
      expect(csv_row.last).to eq subject.longitude
    end
  end
end
