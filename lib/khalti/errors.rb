module Khalti
  module Errors
    class KhaltiError < RuntimeError
    end

    class BlankError < KhaltiError
    end

    class InvalidAmountError < KhaltiError
    end

    class InvalidTokenError < KhaltiError
    end

    class InvalidResponseError < KhaltiError
    end
  end
end
