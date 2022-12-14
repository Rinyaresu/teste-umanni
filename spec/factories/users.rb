# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { 'password' }
    password_confirmation { 'password' }

    factory :invalid_user do
      email { nil }
      password { nil }
      password_confirmation { nil }
    end
  end
end
