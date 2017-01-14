module Exportable
  module ExportMethods
    # Module to handle only CSV exporting
    module CsvExporter
      require 'csv'

      include Exportable::Utils

      def export_csv(options = {})
        export_options = get_export_options(self, @options.merge(options))
        Exporter.new(self).export(export_options)
      end

      # Exporter class for CSV Exporter
      class Exporter
        def initialize(model)
          @model = model
        end

        def export(options)
          CSV.generate do |csv|
            csv << options[:fields].map(&:to_s) if options[:header]
            @model.where(nil).find_each do |record|
              csv << options[:fields].map { |attr| record.send(attr).to_s }
            end
          end
        end
      end
    end
  end
end
