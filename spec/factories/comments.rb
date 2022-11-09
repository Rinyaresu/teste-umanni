# frozen_string_literal: true

FactoryBot.define do
  factory :comment do
    post { create(:post) }
    user { create(:user) }
    content { Faker::Lorem.paragraph }

    factory :invalid_comment do
      content { nil }
    end
  end
end
