module Exportable
  module ExportMethods
    # Module to handle only XLS exporting
    module XmlExporter
      include Exportable::Utils
      Exportable.formats << :xml

      def export_xml(options = {})
        export_options = get_export_options(self, @options.merge(options))
        Exporter.new(self).export(export_options)
      end

      # Exporter class for XML
      class Exporter
        require 'nokogiri'

        def initialize(model)
          @model = model
        end

        def export(options)
          Nokogiri::XML::Builder.new(encoding: 'UTF-8') do |xml|
            xml.root do
              xml.send(@model.model_name.collection) do
                @model.all.each do |record|
                  xml.send(@model.model_name.element) do
                    options[:fields].each do |attr| 
                      xml.send(attr, record.send(attr).to_s)
                    end  
                  end
                end
              end
            end
          end.to_xml
        end

        
      end
    end
  end
end
