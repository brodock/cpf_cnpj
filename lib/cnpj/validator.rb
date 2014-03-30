require 'active_model'

module Cnpj
  class Validator < ActiveModel::EachValidator
    def validate_each(record, attribute, value)
      unless CNPJ.valid? value
        record.errors.add attribute, :invalid, options
      end
    end
  end
end

# Compatibility with ActiveModel validates method which matches option keys to their validator class
ActiveModel::Validations::CnpjValidator = Cnpj::Validator
