#!/usr/bin/env ruby
require 'exif'
require 'optparse'
require './lib/loader'
require './lib/export/manager'

class App
  attr_reader :options

  def initialize(*_args)
    @options = {}

    OptionParser.new do |parser|
      parser.banner = 'Usage: app.rb [options]'

      parser.on('-f', '--format=FORMAT', '# File"s format to output => csv or html.', '# Default: csv') do |v|
        options[:format] = v
      end

      parser.on('-d', '--directory=DIRECTORY', '# Especify a directory to load images.') do |v|
        options[:directory] = v
      end
    end.parse!
  end
end

app = App.new(*ARGV)

loader_attributes = { extractor: Exif::Data }
loader_attributes[:path] = app.options[:directory] unless app.options[:directory].nil?

loader = Loader.new(loader_attributes)
images = loader.images

export_attributes = { images: images }
export_attributes[:format] = app.options[:format] unless app.options[:format].nil?

manager = Export::Manager.new(export_attributes)

begin
  manager.call
rescue Exception => e
  puts e
  exit
end

puts 'Success export :) You can see your file in /output'
