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
      p subject.name
      expect(subject.name).not_to be_nil
    end
  end
end
