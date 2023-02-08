# frozen_string_literal: true

FactoryBot.define do
  factory :transaction do
    amount { rand(0.0..10_000.0).round(2) }
    status { Transaction.statuses.keys.sample }

    factory :transaction_authorize do
      type { Transactions::Authorize.name }
    end

    factory :transaction_charge do
      type { Transactions::Charge.name }
    end

    factory :transaction_refund do
      type { Transactions::Refund.name }
    end

    factory :transaction_reversal do
      type { Transactions::Reversal.name }
    end
  end
end
