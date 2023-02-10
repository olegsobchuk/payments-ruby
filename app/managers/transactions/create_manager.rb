# frozen_string_literal: true

module Transactions
  class CreateManager
    include Contextable

    # for now this is just example of `module` usage
    # TODO: implement some stuff below

    def perform
      # TODO: implement steps for execution
      self
    end

    def success?
      context.errors.blank?
    end
  end
end
