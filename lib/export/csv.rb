require 'csv'

module Export
  class Csv
    def initialize(path: '', file_name: '')
      @dir = "#{path}/#{file_name}"
    end

    def call(images)
      CSV.open(@dir, 'wb', col_sep: ';') do |csv|
        to_csv(csv, images)
      end
    rescue Exception => e
      puts 'Error on export CSV file'
    end

    private

    def to_csv(csv, images)
      csv << header
      images.map { |image| csv << image.to_csv }
      csv
    end

    def header
      ['File name', 'Latitude', 'Longitude']
    end
  end
end
