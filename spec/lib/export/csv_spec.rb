require 'spec_helper'
require 'faker'
require 'export/csv'

RSpec.describe Export::Csv do
  let(:file) { 'export.csv' }
  let(:path) { 'spec/data/output' }

  let(:image) do
    double(
      'Image',
      to_csv: ['image.jpg', Faker::Number.number, Faker::Number.number]
    )
  end

  let(:images) { [image] }

  subject do
    Export::Csv.new(
      path: path,
      file_name: file
    )
  end

  describe '#call' do
    after(:all) do
      file = 'spec/data/output/export.csv'
      File.delete(file) if File.exist?(file)
    end

    it 'generate a csv file' do
      subject.call(images)
      path_file = "#{path}/#{file}"

      expect(File.exist?(path_file)).to be_truthy
    end

    it 'output an error message' do
      subject = Export::Csv.new

      expect do
        subject.call({})
      end.to output("Error on export CSV file\n").to_stdout
    end
  end
end
