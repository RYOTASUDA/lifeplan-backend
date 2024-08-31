FactoryBot.define do
  factory :user do
    name { FFaker::NameJA.name }
    sequence(:email) { |n| "test#{n}@gmail.com" }
  end
end
