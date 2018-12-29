FactoryBot.define do
  factory :post do
    user
    body { "hogehoge" }
    title { "foobar" }
    budget { 10000 }
  end
end
