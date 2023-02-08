class Merchant < ApplicationRecord
  enum status: {
    active: :active,
    inactive: :inactive
  }

  has_many :transactions
  has_many :customers, trough: :transactions

  validation :name, presence: true
  validation :email, format: { with: URI::MailTo::EMAIL_REGEXP }

  def total_transactions_sum
    transactions.sum
  end
end
