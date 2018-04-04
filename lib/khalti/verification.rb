# frozen_string_literal: true

require 'uri'
require 'net/http'
require 'json'

module Khalti
  # Khalti verification API wrapper
  class Verification
    API_URL = 'https://khalti.com/api/payment/verify/'
    SECRET_KEY = ENV['KHALTI_SECRET_KEY']
    def self.verify(token, amount)
      raise Errors::BlankError, 'Ensure token is not blank.' \
        if token.nil? || token.strip.empty?
      raise Errors::InvalidTokenError, 'Ensure token has at least 22 characters.' \
        if token.strip.size < 22
      raise Errors::InvalidAmountError, 'Ensure amount is greate than 0 paisa.' \
        if Integer(amount) <= 0
      params = { 'token': token, 'amount': amount.to_i }
      RequestHelper.post(API_URL, params)
    end
  end
end
