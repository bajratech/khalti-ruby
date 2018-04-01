module Khalti
  module RequestHelper
    SECRET_KEY = ENV['KHALTI_SECRET_KEY']

    def self.get(path)
      uri = URI.parse(path)
      req = Net::HTTP::Get.new(uri)
      req['authorization'] = "Key #{SECRET_KEY}"
      response = Net::HTTP.start(uri.hostname, uri.port, use_ssl: true) {|http|
        http.request(req)
      }

      if response.code.to_i == 200 || response.code.to_i == 204
        JSON.parse(response.body)
      elsif response.code.to_i == 400 # Validation error
        Khalti::ValidationsFailed.new(response.body)
      else
        Khalti::Util.raise_exception_for_status_code(response.code)
      end
    end

    def self.post(path, params)
      uri = URI.parse(path)
      req = Net::HTTP::Post.new(uri)
      req['authorization'] = "Key #{SECRET_KEY}"
      req.set_form_data(params)
      response = Net::HTTP.start(uri.hostname, uri.port, use_ssl: true) {|http|
        http.request(req)
      }

      if response.code.to_i == 200 || response.code.to_i == 204
        JSON.parse(response.body)
      elsif response.code.to_i == 400 # Validation error
        Khalti::ValidationsFailed.new(response.body)
      else
        Khalti::Util.raise_exception_for_status_code(response.code)
      end
    end
  end
end
