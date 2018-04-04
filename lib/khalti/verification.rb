require 'uri'
require 'net/http'
require 'json'

module Khalti
  class Verification
    API_URL = "https://khalti.com/api/payment/verify/".freeze
    SECRET_KEY = ENV['KHALTI_SECRET_KEY']
    def self.verify(token, amount)
      raise Errors::BlankError.new('Ensure token is not blank.') if token.nil? || token.strip.empty?
      raise Errors::InvalidTokenError.new('Ensure token has at least 22 characters.') if token.strip.size < 22
      raise Errors::InvalidAmountError.new('Ensure amount is greate than 0 paisa.') if Integer(amount) < 0
      params = {'token': token, 'amount': Integer(amount)}
      RequestHelper.post(API_URL, params)
    end
  end
end
