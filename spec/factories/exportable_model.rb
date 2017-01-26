FactoryGirl.define do
  factory :exportable_model do
    field_string "sample string"
    field_text "sample text"
    field_date Date.today
  end 
end
