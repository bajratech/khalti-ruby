module Khalti
  module Errors
    class KhaltiError < RuntimeError
      attr_reader :data
      def initialize(data)
        @data = data
        super
      end
    end

    class BlankError < RuntimeError
    end

    class InvalidAmountError < RuntimeError
    end

    class InvalidTokenError < RuntimeError
    end
  end
end
