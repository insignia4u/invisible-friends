FactoryGirl.define do
  factory :game do
    name "Mysterious party"
    scheduled_on { 3.days.from_now }
    description "Price range between $50 and $150"

    trait :invalid do
      name ""
      scheduled_on { 3.days.ago }
    end
  end
end
