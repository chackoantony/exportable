module Exportable
  # This module serves as a container for export modules
  module ExportMethods
    include CsvExporter
    include XlsExporter
    include XmlExporter

    def export(format, options = {})
      unless Exportable.formats.include?(format.to_sym)
        raise ArgumentError, "Unsupported output format '#{format}'"
      end
      send("export_#{format}", options.merge({methods: []}))
    end

    def export_attributes(options = {})
      get_export_options(self, @options.merge(options))[:fields].map(&:to_s) rescue self.attribute_names
    end
  end
end
