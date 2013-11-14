require 'faraday'
require 'faraday_middleware'

module ReadabilityParser
  module Connection

    # Instantiate a Faraday::Connection
    # @private
    private

    # Returns a Faraday::Connection object
    #
    # @return [Faraday::Connection]
    def connection(options = {})
      options = {
        :url => ReadabilityParser.api_endpoint
      }.merge(options)

      connection = Faraday.new(options) do |c|
        # encode request params as "www-form-urlencoded"
        c.use Faraday::Request::UrlEncoded

        c.use FaradayMiddleware::FollowRedirects, limit: 3

        # raise exceptions on 40x, 50x responses
        c.use Faraday::Response::RaiseError

        c.response :xml, :content_type => /\bxml$/
        c.response :json, :content_type => /\bjson$/

        c.adapter Faraday.default_adapter
      end

      connection.headers[:user_agent] = ReadabilityParser.user_agent

      connection
    end
  end # Connection
end
