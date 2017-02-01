FactoryGirl.define do
  factory :user do
    sequence(:username) { |n| "testuser#{n}" }
    sequence(:email) { |n| "test#{n}@test.com" }
    password 'testing'
  end
end
