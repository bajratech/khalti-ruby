require 'uri'
require 'net/http'
require 'json'

module Khalti
  class Verification
    API_URL = "https://khalti.com/api/payment/verify/"
    SECRET_KEY = ENV['KHALTI_SECRET_KEY']
    def self.verify(token, amount)
      raise 'Invalid Token' if token.nil? || token.strip.empty?
      raise 'Invalid Amount' if Integer(amount) < 0
      headers = {
        Authorization: "Key #{SECRET_KEY}"
      }
      uri = URI.parse(API_URL)
      https = Net::HTTP.new(uri.host, uri.port)
      https.use_ssl = true
      request = Net::HTTP::Post.new(uri.request_uri, headers)
      request.set_form_data('token' => "#{token}", 'amount' => "#{Integer(amount)}")
      response = https.request(request)

      JSON.parse(response.body) || {}
    end
  end
end
