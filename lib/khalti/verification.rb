# frozen_string_literal: true

require 'uri'
require 'net/http'
require 'json'

module Khalti
  # Khalti verification API wrapper
  class Verification
    API_URL = 'https://khalti.com/api/payment/verify/'
    SECRET_KEY = ENV['KHALTI_SECRET_KEY']
    class << self
      def verify(token, amount)
        validate_blank_token(token)
        validate_token_length(token)
        validate_ammount(amount)
        params = { 'token': token, 'amount': amount.to_i }
        RequestHelper.post(API_URL, params)
      end

      def validate_blank_token(val)
        return unless val.nil? || val.strip.empty?
        raise Errors::BlankError, 'Ensure token is not blank.'
      end

      def validate_token_length(val)
        return if val.strip.size >= 22
        raise Errors::InvalidTokenError, 'Ensure token has at least ' \
          '22 characters.'
      end

      def validate_ammount(val)
        return if Integer(val).positive?
        raise Errors::InvalidAmountError, 'Ensure amount is ' \
          'greater than 0 paisa.'
      end
    end
  end
end
