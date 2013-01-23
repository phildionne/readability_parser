module Readability
  class Error < StandardError

    class ClientError < Error

      def initialize(error=nil)
        parsed_error = parse_error(error)
        http_error = error.response[:status].to_i

        if ERROR_MAP.has_key?(http_error)
          raise ERROR_MAP[http_error].new(parsed_error[:messages])
        else
          super
        end
      end

      def parse_error(error)
        JSON.parse(error.response[:body], :symbolize_names => true)
      end
    end # ClientError

    class ConfigurationError < Readability::Error; end

    # Raised when Readability returns a 400 HTTP status code
    class BadRequest < Readability::Error; end

    # Raised when Readability returns a 401 HTTP status code
    class UnauthorizedRequest < Readability::Error; end

    # Raised when Readability returns a 403 HTTP status code
    class Forbidden < Readability::Error; end

    # Raised when Readability returns a 404 HTTP status code
    class NotFound < Readability::Error; end

    # Raised when Readability returns a 500 HTTP status code
    class InternalServerError < Readability::Error; end

    ERROR_MAP = {
      400 => Readability::Error::BadRequest,
      401 => Readability::Error::UnauthorizedRequest,
      403 => Readability::Error::Forbidden,
      404 => Readability::Error::NotFound,
      500 => Readability::Error::InternalServerError
    }
  end # Error
end
