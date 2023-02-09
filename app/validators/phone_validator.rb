# frozen_string_literal: true

class PhoneValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    return unless value
    return if value.match?(/^\+?[-\d()]+$/)

    record.errors.add(attribute, :phone_invalid)
  end
end
