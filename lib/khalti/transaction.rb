require 'uri'
require 'net/http'
require 'json'

module Khalti
  class Transaction
    API_URL = 'https://khalti.com/api/merchant-transaction'
    def self.find(idx)
      raise 'Invalid idx' if idx.nil? || idx.strip.empty?
      Khalti::RequestHelper.get("#{API_URL}/#{idx}/")
    end

    def self.all
      Khalti::RequestHelper.get("#{API_URL}/")
    end
  end
end
