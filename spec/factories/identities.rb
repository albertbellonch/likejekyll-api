FactoryGirl.define do
  factory :identity do
    sequence(:ip) { |n| "192.168.1.#{n}" }
  end
end
