require 'spec_helper'
require 'faker'
require 'export/html'

RSpec.describe Export::HTML do
  let(:file) { 'export.html' }
  let(:path) { 'spec/data/output' }

  let(:image) do
    double(
      'Image',
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
    after(:all) do
      file = 'spec/data/output/export.html'
      File.delete(file) if File.exist?(file)
    end

    it 'generate a html file' do
      subject.call(images)
      path_file = "#{path}/#{file}"

      expect(File.exist?(path_file)).to be_truthy
    end

    it 'output an error message' do
      subject = Export::HTML.new

      expect do
        subject.call({})
      end.to output("Error on export HTML file\n").to_stdout
    end
  end
end
