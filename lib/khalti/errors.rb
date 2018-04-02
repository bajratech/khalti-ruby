module Khalti
  module Errors
    class KhaltiError < RuntimeError
      attr_reader :data
      def initialize(data)
        @data = data
        super
      end
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
