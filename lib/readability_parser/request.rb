require 'readability_parser/error'

module ReadabilityParser
  module Request

    # Performs a HTTP Get request
    def get(path, params={})
      request(:get, path, params)
    end


    private

    # Returns a Faraday::Response object
    #
    # @return [Faraday::Response]
    def request(method, path, params = {})
      raise ReadabilityParser::Error::ConfigurationError.new("Please configure ReadabilityParser.api_token first") if api_token.nil?

      params.merge!({
        :token => api_token,
        :format => format
      })

      connection_options = {}

      begin
        response = connection(connection_options).send(method) do |request|
          request.url(path, params)
        end
      rescue Faraday::Error::ClientError => error
        if error.is_a?(Faraday::Error::ClientError)
          raise ReadabilityParser::Error::ClientError.new(error)
        else
          raise ReadabilityParser::Error::RequestError.new(error)
        end
      end

      # When using xml format the response is wrapped in a <response> node
      if response.body['response']
        # TODO: When using xml format, the response.body hash values are all strings.
        # Maybe convert values to proper type?
        response.body['response']
      else
        response.body
      end
    end
  end # Request
end
