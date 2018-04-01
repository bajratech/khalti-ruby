module Khalti
  module RequestHelper
    SECRET_KEY = ENV['KHALTI_SECRET_KEY']
    def self.get(path)
      uri = URI.parse(path)
      req = Net::HTTP::Get.new(uri)
      req['authorization'] = "Key #{SECRET_KEY}"
      res = Net::HTTP.start(uri.hostname, uri.port, use_ssl: true) {|http|
        http.request(req)
      }
      JSON.parse(res.body)
    end

    def self.post(path, params)
      uri = URI.parse(path)
      req = Net::HTTP::Post.new(uri)
      req['authorization'] = "Key #{SECRET_KEY}"
      req.set_form_data(params)
      res = Net::HTTP.start(uri.hostname, uri.port, use_ssl: true) {|http|
        http.request(req)
      }
      JSON.parse(res.body)
    end
  end
end
