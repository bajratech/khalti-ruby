require 'uri'
require 'net/http'
require 'json'

module Khalti
  class Verification
    @api_url = "https://khalti.com/api/payment/verify/"
    def self.verify(token, amount)
      secret_key = ENV['KHALTI_SECRET_KEY']
      headers = {
        Authorization: "Key #{secret_key}"
      }
      uri = URI.parse("#{@api_url}")
      https = Net::HTTP.new(uri.host, uri.port)
      https.use_ssl = true
      request = Net::HTTP::Post.new(uri.request_uri, headers)
      request.set_form_data('token' => "#{token}", 'amount' => "#{amount}")
      response = https.request(request)

      JSON.parse(response.body) || {}
    end
  end
end
