# frozen_string_literal: true

FactoryBot.define do
  factory :post do
    user { create(:user) }
    title { Faker::Lorem.sentence }
    content { Faker::Lorem.paragraph }

    factory :invalid_post do
      user { create(:user) }
      title { nil }
      content { nil }
    end
  end
end
