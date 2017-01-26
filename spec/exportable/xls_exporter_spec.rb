require "spec_helper"

describe 'Export XLS' do

  before(:each) do
    create(:exportable_model)
  end

  it "responds to export_csv" do
    ExportableModel.class_eval{ exportable }
    expect(ExportableModel.respond_to? 'export_xls').to be_truthy 
  end

  it "exports csv data" do
    ExportableModel.class_eval{ exportable }
    sheet = write_xls
    expect(sheet.row(1)[1]).to eq 'sample string'
  end
  
  it "exports csv data with 'only' option" do
    ExportableModel.class_eval{ exportable only: [:field_string] }
    sheet = write_xls
    expect(sheet.row(0)).not_to include('field_text')  
  end

  it "exports csv data with 'except' option" do
    ExportableModel.class_eval{ exportable except: [:field_string] }
    sheet = write_xls
    expect(sheet.row(0)).not_to include('field_string')  
  end

  it "exports csv data with 'header' option" do
    ExportableModel.class_eval{ exportable header: false }
    sheet = write_xls
    expect(sheet.row(0)).not_to include('field_string')  
  end

  it "exports csv data with 'methods' option" do
    ExportableModel.class_eval do  
      exportable methods: [:title]
      def title
        field_string.upcase
      end
    end
    sheet = write_xls
    expect(sheet.row(0)).to include('title')  
  end

  it "has option preference on utility method" do
    ExportableModel.class_eval{ exportable only: [:field_string]}
    sheet = write_xls only: [:field_string, :field_text]
    expect(sheet.row(0)).to include('field_text')  
  end

end 
