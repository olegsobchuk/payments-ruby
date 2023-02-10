# frozen_string_literal: true

module Contextable
  extend ActiveSupport::Concern

  included do
    attr_writer :context

    def initialize(data = {})
      @context = OpenStruct.new(data)
    end

    def context
      @context || OpenStruct.new()
    end
  end

  class_methods do
    def perform(data = {})
      new(data).perform
    end
  end
end
