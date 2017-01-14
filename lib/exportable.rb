# Core module for the Gem
module Exportable
  extend ActiveSupport::Autoload
  mattr_accessor :formats
  self.formats = []

  autoload :ClassMethods
  autoload :ExportMethods
  autoload :Utils

  autoload_under 'export_methods' do
    autoload :CsvExporter
    autoload :XlsExporter
  end

  def self.included(base)
    base.extend(ClassMethods)
  end
end

ActiveSupport.on_load(:active_record) do
  include Exportable
end
