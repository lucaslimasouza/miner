require 'spec_helper'
require 'faker'
require 'export/html'

RSpec.describe Export::HTML do
  let(:file) { 'export.html' }
  let(:path) { 'spec/data/output' }

  let(:image) do
    double(
      'Image',
      name: 'image.jpg',
      latitude: Faker::Number.number,
      longitude: Faker::Number.number,
      to_html: '<tr></tr>'
    )
  end

  let(:images) { [image] }

  subject do
    Export::HTML.new(
      path: path,
      file_name: file
    )
  end

  describe '#call' do
    after(:each) do
      File.delete("#{path}/#{file}")
    end

    it 'generate a html file' do
      subject.call(images)
      path_file = "#{path}/#{file}"

      expect(File.exist?(path_file)).to be_truthy
    end
  end
end
