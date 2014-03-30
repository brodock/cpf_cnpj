require 'active_model'

module Cpf
  class Validator < ActiveModel::EachValidator
    def validate_each(record, attribute, value)
      unless CPF.valid? value
        record.errors.add attribute, :invalid, options
      end
    end
  end
end

# Compatibility with ActiveModel validates method which matches option keys to their validator class
ActiveModel::Validations::CpfValidator = Cpf::Validator
