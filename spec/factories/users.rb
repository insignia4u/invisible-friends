FactoryGirl.define do
  factory :user, aliases: [:friend] do
    name "John"
    provider "facebook"
    uid 12324
    sequence(:email) { |n| "somemail-#{n}@email.com" }
    oauth_token "some_token"
    oauth_expires_at 123
  end
end
