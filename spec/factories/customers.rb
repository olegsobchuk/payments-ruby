# frozen_string_literal: true

FactoryBot.define do
  factory :customer do
    sequence(:email) { |num| "customer_#{num}@email.omg" }
    sequence(:phone) { |num| "+38011-123-12-#{num}" }
  end
end
