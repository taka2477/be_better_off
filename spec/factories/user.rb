FactoryBot.define do
  factory :user do
    sequence(:username) { |u| "test_user#{u}" }
    password { 123456 }
    password_confirmation { 123456 }
    age { 28 }
    accepted { true }
    gender { "男性" }
    sequence(:email) { |n| "test#{n}@test.com" }
  end
end
