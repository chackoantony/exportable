module Exportable
  # This module holds Model level hook methods
  module ClassMethods
    def exportable(options = {})
      @options = options
      extend(ExportMethods)
    end
  end
end
