module Exportable
  # This module serves as a container for export modules
  module ExportMethods
    include CsvExporter
    include XlsExporter

    def export(format, options = {})
      unless Exportable.formats.include?(format.to_sym)
        raise ArgumentError, "Unsupported output format '#{format}'"
      end
      send("export_#{format}", options)
    end
  end
end
