# frozen_string_literal: true

class Merchant < ApplicationRecord
  enum status: {
    active: :active,
    inactive: :inactive
  }

  has_many :transactions, inverse_of: :merchant
  has_many :customers, through: :transactions

  validates :name, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }

  def total_transactions_sum
    transactions.total_amount
  end
end
