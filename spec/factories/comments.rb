FactoryBot.define do
  factory :comment do
    post
    user
    content { "test" }
  end
end
