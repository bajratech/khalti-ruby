module Khalti
  module Util
    def self.raise_exception_for_status_code(status_code, message=nil)
      case status_code.to_i
      when 401
        raise AuthenticationError
      when 403
        raise AuthorizationError, message
      when 404
        raise NotFoundError
      when 500
        raise ServerError
      when 503
        raise DownForMaintenanceError
      else
        raise UnexpectedError, "Unexpected HTTP_RESPONSE #{status_code.to_i}"
      end
    end
  end
end