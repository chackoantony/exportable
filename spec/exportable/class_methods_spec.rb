require "spec_helper"


describe Exportable::ClassMethods, type: :model do
  
  before(:each) do
    create(:exportable_model)
  end
  
  it "adds 'exportable' method to model" do
    expect(ExportableModel.respond_to? 'exportable').to be_truthy 
  end


end