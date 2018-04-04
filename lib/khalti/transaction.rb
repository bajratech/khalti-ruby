require 'uri'
require 'net/http'
require 'json'

module Khalti
  class Transaction
    API_URL = 'https://khalti.com/api/merchant-transaction'.freeze
    def self.find(idx)
      raise Errors::BlankError, 'Ensure idx is not blank.' \
        if idx.nil? || idx.strip.empty?
      RequestHelper.get("#{API_URL}/#{idx}/")
    end

    def self.all
      RequestHelper.get("#{API_URL}/")
    end
  end
end
