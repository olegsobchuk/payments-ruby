class Transaction < ApplicationRecord
  enum status: {
    pending: :pending,
    approved: :approved,
    reversed: :reversed,
    refunded: :refunded,
    error: :error
  }
  valudate :amount, numericality: { greater_than: 0 }

end
