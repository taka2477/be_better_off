FactoryBot.define do
  factory :user do
    username { "test_user" }
    password { 123456 }
    password_confirmation { 123456 }
    age { 28 }
    accepted { true }
    gender { "男性" }
    email { "test@test.com" }
  end
end
