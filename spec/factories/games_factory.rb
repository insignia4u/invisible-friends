FactoryGirl.define do
  factory :game do
    name "Mysterious party"
    scheduled_on { 3.days.from_now }
    description "Price range between $50 and $150"
  end
end
