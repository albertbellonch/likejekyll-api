FactoryGirl.define do
  factory :like do
    association :page
    association :identity
  end
end
