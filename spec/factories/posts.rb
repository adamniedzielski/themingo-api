# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :post do
  	title "test post"
  	body  "Its just a test post in factoryGirl"
  	weekly_theme
  end
end
