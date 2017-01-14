module Exportable
  module ExportMethods
    # Module to handle only XLS exporting
    module XlsExporter
      require 'spreadsheet'

      include Exportable::Utils

      def export_xls(options = {})
        export_options = get_export_options(self, @options.merge(options))
        Exporter.new(self).export(export_options)
      end

      # Exporter class for XLS Exporter
      class Exporter
        def initialize(model)
          @book = Spreadsheet::Workbook.new
          @model = model
        end

        def export(options)
          sheet = @book.create_worksheet
          i = 0
          if options[:header]
            sheet.row(i).concat(options[:fields].map(&:to_s))
            i += 1
          end
          @model.where(nil).find_each do |record|
            sheet.row(i).concat options[:fields].map { |attr| record.send(attr).to_s }
            i += 1
          end
          write_io_output
        end

        def write_io_output
          output = StringIO.new
          @book.write output
          output.string
        end
      end
    end
  end
end
