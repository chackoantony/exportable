module Exportable
  # This module serves as a container for export modules
  module ExportMethods
    include CsvExporter
    include XlsExporter
  end
end
