# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :warehouse do
    name "MyString"
    serial "MyString"
    hardwaretype_id 1
    pdate "2013-02-13"
    specs "MyText"
    apps "MyText"
    notes "MyText"
  end
end
