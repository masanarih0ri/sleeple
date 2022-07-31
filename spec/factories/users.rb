# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    # Faker::Internet.password(min_length: 8)
    email { 'testuser1@example.com' }
    password { 'testuser1' }
    name { 'testuser1' }
  end
end
