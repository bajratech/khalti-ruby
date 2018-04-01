module Khalti
  class KhaltiError < ::StandardError; end

  class AuthenticationError < KhaltiError; end

  class AuthorizationError < KhaltiError; end

  class NotFoundError < KhaltiError; end

  class ServerError < KhaltiError; end

  class DownForMaintenanceError < KhaltiError; end

  class UnexpectedError < KhaltiError; end

  class ConfigurationError < KhaltiError; end

  class InvalidTokenError < KhaltiError; end

  class ValidationsFailed < KhaltiError
    def initialize(error_result)
      @error_result = error_result
    end

    def inspect
      "#<#{self.class} error_result: #{@error_result.inspect}>"
    end

    def to_s
      JSON.parse(@error_result)
    end
  end
  
end