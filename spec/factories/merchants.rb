# frozen_string_literal: true

FactoryBot.define do
  factory :merchant do
    sequence(:name) { |num| "John Dou #{num}" }
    sequence(:email) { |num| "merchant_#{num}@email.omg" }
    status { Merchant.statuses.keys.sample }
  end
end
