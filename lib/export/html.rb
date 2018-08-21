module Export
  class HTML
    def initialize(path:, file_name:)
      @dir = "#{path}/#{file_name}"
    end

    def call(images)
      File.open(@dir, 'w') { |f| f.write to_html(images) }
    end

    private

    def to_html(images)
      images_to_html = images.map(&:to_html).join('')
      header + images_to_html + footer
    end

    def header
      ''"
      <!DOCTYPE html>
      <html>
        <head>
          <title>EXIF GPS Extractor</title>
        </head>
        <body>
          <table>
            <thead>
              <tr>
                <td>Name</td>
                <td>Latitude</td>
                <td>Longitude</td>
              </tr>
            </thead>
            <tbody>
        "''
    end

    def footer
      ''"
              </tbody>
            </table>
          </body>
        </html>
      "''
    end
  end
end
