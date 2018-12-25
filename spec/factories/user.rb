FactoryBot.define do
  factory :user do
    sequence(:username) { |n| "test_user#{n}" }
    sequence(:email) { |n| "test#{n}@test.com" }
    password { 123456 }
    password_confirmation { 123456 }
    age { 28 }
    accepted { true }
    gender { "男性" }
  end
end
