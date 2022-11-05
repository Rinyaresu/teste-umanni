# frozen_string_literal: true

FactoryBot.define do
  factory :post do
    title { Faker::Lorem.sentence }
    content { Faker::Lorem.paragraph }

    factory :invalid_post do
      title { nil }
      content { nil }
    end
  end
end
