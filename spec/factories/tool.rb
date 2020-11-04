# spec/factories/tool.rb

# frozen_string_literal:true

FactoryBot.define do
  factory :tool do
    title { Faker::Lorem.word }
    link  { Faker::Internet.url }
    description { Faker::GreekPhilosophers.quote }
    tags { Faker::Books::Lovecraft.words }
    created_by { Faker::Number.number(digits: 10) }
  end
end
