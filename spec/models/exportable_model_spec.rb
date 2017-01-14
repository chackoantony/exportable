require "spec_helper"


describe ExportableModel, type: :model do
	
  before(:each) do
  	ExportableModel.create!(field_string: "sample string", field_text: "sample text", field_date: Date.today )
  end
	
	it "responds to exportable" do
	  expect(ExportableModel.respond_to? 'exportable').to be_truthy 
	end


end