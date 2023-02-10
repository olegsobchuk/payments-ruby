# frozen_string_literal: true

class Transaction < ApplicationRecord
  TYPES = %i[authorize charge refund reversal].freeze

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
    TYPES.each do |type| # just example for metaprogramming
      define_method "type_#{type}" do
        where(type: "#{name}s::#{type.to_s.capitalize}")
      end
    end

    def total_amount
      sum(:amount)
    end
  end
end
