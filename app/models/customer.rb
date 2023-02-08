# frozen_string_literal: true

class Customer < ApplicationRecord
  has_many :transactions
  has_many :merchants, through: :transactions

  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  # validate :phone
end
