require 'uri'
require 'net/http'
require 'json'

module Khalti
  class Transaction
    API_URL = 'https://khalti.com/api/merchant-transaction'
    SECRET_KEY = ENV['KHALTI_SECRET_KEY']
    def self.find(idx)
      raise 'Invalid idx' if idx.nil? || idx.strip.empty?
      headers = {
        Authorization: "Key #{SECRET_KEY}"
      }
      uri = URI.parse("#{API_URL}/#{idx}/")
      https = Net::HTTP.new(uri.host, uri.port)
      https.use_ssl = true
      request = Net::HTTP::Get.new(uri.request_uri, headers)
      response = https.request(request)

      JSON.parse(response.body) || {}
    end

    def self.all
      headers = {
        Authorization: "Key #{SECRET_KEY}"
      }
      uri = URI.parse("#{API_URL}/")
      https = Net::HTTP.new(uri.host, uri.port)
      https.use_ssl = true
      request = Net::HTTP::Get.new(uri.request_uri, headers)
      response = https.request(request)

      JSON.parse(response.body) || {}
    end
  end
end
