# frozen_string_literal: true

class Customer < ApplicationRecord
  has_many :transactions, dependent: :restrict_with_exception
  has_many :merchants, through: :transactions

  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :phone, phone: true
end
