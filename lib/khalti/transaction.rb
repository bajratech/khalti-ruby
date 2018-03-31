require 'uri'
require 'net/http'
require 'json'

module Khalti
  class Transaction
    @api_url = 'https://khalti.com/api/merchant-transaction'
    def self.find(idx)
      secret_key = ENV['KHALTI_SECRET_KEY'] #test_secret_key_f59e8b7d18b4499ca40f68195a846e9b
      headers = {
        Authorization: "Key #{secret_key}"
      }
      uri = URI.parse("#{@api_url}/#{idx}/")
      https = Net::HTTP.new(uri.host, uri.port)
      https.use_ssl = true
      request = Net::HTTP::Get.new(uri.request_uri, headers)
      response = https.request(request)

      JSON.parse(response.body) || {}
    end

    def self.all
      secret_key = ENV['KHALTI_SECRET_KEY'] #test_secret_key_f59e8b7d18b4499ca40f68195a846e9b
      headers = {
        Authorization: "Key #{secret_key}"
      }
      uri = URI.parse("#{@api_url}/")
      https = Net::HTTP.new(uri.host, uri.port)
      https.use_ssl = true
      request = Net::HTTP::Get.new(uri.request_uri, headers)
      response = https.request(request)

      JSON.parse(response.body) || {}
    end
  end
end
