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
  
end