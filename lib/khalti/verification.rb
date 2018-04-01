module Khalti
  class Verification
    API_URL = "https://khalti.com/api/payment/verify/"
    SECRET_KEY = ENV['KHALTI_SECRET_KEY']
    def self.verify(token, amount)
      raise 'Invalid Token' if token.nil? || token.strip.empty?
      raise 'Invalid Amount' if Integer(amount) < 0
      params = {'token': token, 'amount': Integer(amount)}
      Khalti::RequestHelper.post(API_URL, params)
    end
  end
end
