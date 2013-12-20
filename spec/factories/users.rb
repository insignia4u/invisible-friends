FactoryGirl.define do
  factory :user do
    name "John"
    provider "facebook"
    uid 12324
    email "somemail@mail.com"
    oauth_token "some_token"
    oauth_expires_at 123
  end
end
