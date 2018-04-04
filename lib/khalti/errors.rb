# frozen_string_literal: true

module Khalti
  module Errors
    # Custom error class to handle RuntimeError
    class KhaltiError < RuntimeError; end

    # Custom error class to handle blank variables
    class BlankError < KhaltiError; end

    # Custom error class to handle invalid amount
    class InvalidAmountError < KhaltiError; end

    # Custom error class to handle invalid token
    class InvalidTokenError < KhaltiError; end

    # Custom error class to handle invalid response data
    class InvalidResponseError < KhaltiError; end
  end
end
