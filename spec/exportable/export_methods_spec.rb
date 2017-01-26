require "spec_helper"


describe Exportable::ExportMethods, type: :model do
  
  before(:each) do
    create(:exportable_model)
    ExportableModel.class_eval{ exportable }
  end
  
  it "adds 'export' method to model" do
    expect(ExportableModel.respond_to? 'export').to be_truthy 
  end

  describe '.export' do 
    it 'generates output format string on model' do
      csv = CSV.parse(ExportableModel.export(:csv), headers: true)
      expect(csv.first['field_string']).to eq 'sample string' 
    end

    it 'generates output format string on model with options' do
      csv = CSV.parse(ExportableModel.export(:csv, only: [:field_string]), headers: true)
      expect(csv.headers).not_to include('field_text')  
    end

    it 'raise error on invalid output format' do
      expect{ExportableModel.export(:tsv)}.to raise_error(ArgumentError) 
    end
  end   

end