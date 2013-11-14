require 'multi_json'

module ReadabilityParser
  class Error < StandardError

    # Raised when Readability returns a 4xx or 500 HTTP status code
    class ClientError < Error

      # Creates a new error from an HTTP environement
      #
      # @param response [Hash]
      # @return [ReadabilityParser::Error::ClientError]
      def initialize(error = nil)
        parsed_error = parse_error(error)
        http_error = error.response[:status].to_i

        if ERROR_MAP.has_key?(http_error)
          raise ERROR_MAP[http_error].new(parsed_error[:messages])
        else
          super
        end
      end


      private

      def parse_error(error)
        MultiJson.load(error.response[:body], :symbolize_keys => true)
      end
    end # ClientError

    class ConfigurationError < ReadabilityParser::Error; end

    # Raised when there's an error in Faraday
    class RequestError < ReadabilityParser::Error; end

    # Raised when ReadabilityParser returns a 400 HTTP status code
    class BadRequest < ReadabilityParser::Error; end

    # Raised when ReadabilityParser returns a 401 HTTP status code
    class UnauthorizedRequest < ReadabilityParser::Error; end

    # Raised when ReadabilityParser returns a 403 HTTP status code
    class Forbidden < ReadabilityParser::Error; end

    # Raised when ReadabilityParser returns a 404 HTTP status code
    class NotFound < ReadabilityParser::Error; end

    # Raised when ReadabilityParser returns a 500 HTTP status code
    class InternalServerError < ReadabilityParser::Error; end

    ERROR_MAP = {
      400 => ReadabilityParser::Error::BadRequest,
      401 => ReadabilityParser::Error::UnauthorizedRequest,
      403 => ReadabilityParser::Error::Forbidden,
      404 => ReadabilityParser::Error::NotFound,
      500 => ReadabilityParser::Error::InternalServerError
    }
  end # Error
end
