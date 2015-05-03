FactoryGirl.define do
  factory :page do
    sequence(:uri) { |n| "https://bellonch.com/inventions/#{n}" }
  end
end
