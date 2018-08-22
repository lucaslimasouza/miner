require_relative 'csv'
require_relative 'html'

module Export
  class Manager
    PATH = 'output'.freeze
    FILE_NAME = 'export'.freeze

    def initialize(images:, format: 'csv')
      @images = images
      @format = format
    end

    def call
      case @format
      when 'csv'
        Export::Csv
          .new(path: PATH, file_name: "#{FILE_NAME}.csv")
          .call(@images)
      when 'html'
        Export::HTML
          .new(path: PATH, file_name: "#{FILE_NAME}.html")
          .call(@images)
      else
        raise 'Invalid format'
      end
    end
  end
end
