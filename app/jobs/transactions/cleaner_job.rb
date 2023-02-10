# frozen_string_literal: true

module Transactions
  class CleanerJob < ApplicationJob
    queue_as :default

    def perform
      Transaction
        .where('created_at < ?', 2.hours.ago) # take into account that this time in UTC +00:00 now
        .delete_all
    end
  end
end
