# frozen_string_literal: true

class Transaction < ApplicationRecord
  enum status: {
    pending: :pending,
    approved: :approved,
    reversed: :reversed,
    refunded: :refunded,
    error: :error
  }

  belongs_to :merchant
  belongs_to :customer

  validates :amount, numericality: { greater_than: 0 }

  class << self
    def total_amount
      sum(:amount)
    end
  end
end
