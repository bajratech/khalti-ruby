module Khalti
  module RequestHelper
    SECRET_KEY = ENV['KHALTI_SECRET_KEY']
    def self.get(path)
      self.validate_secret_key
      uri = URI.parse(path)
      req = Net::HTTP::Get.new(uri)
      req['authorization'] = "Key #{SECRET_KEY}"
      res = Net::HTTP.start(uri.hostname, uri.port, use_ssl: true) {|http|
        http.request(req)
      }
      case res
      when Net::HTTPSuccess
        self.validate_content_type(res['content-type'])
        JSON.parse res.body
      else
        raise Errors::KhaltiError, res.message
      end
    end

    def self.post(path, params)
      self.validate_secret_key
      uri = URI.parse(path)
      req = Net::HTTP::Post.new(uri)
      req['authorization'] = "Key #{SECRET_KEY}"
      req.set_form_data(params)
      res = Net::HTTP.start(uri.hostname, uri.port, use_ssl: true) {|http|
        http.request(req)
      }
      case res
      when Net::HTTPSuccess
        self.validate_content_type(res['content-type'])
        JSON.parse res.body
      else
        raise Errors::KhaltiError, res.message
      end
    end

    private

    def self.validate_secret_key
      return unless SECRET_KEY.nil? || SECRET_KEY.strip.empty?
      raise Errors::BlankError, 'Ensure KHALTI_SECRET_KEY is not blank.'
    end

    def self.validate_content_type(content_type)
      return if content_type == 'application/json'
      raise Errors::InvalidResponseError,
            'Content-type is not application/json.'
    end
  end
end
