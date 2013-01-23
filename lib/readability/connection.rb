require 'faraday'
require 'faraday_middleware'

module Readability
  module Connection
    # Instantiate a Faraday::Connection
    # @private
    private

    # Returns a Faraday::Connection object
    #
    # @return [Faraday::Connection]
    def connection(options={})

      options = {
        :url => Readability.api_endpoint
        }.merge(options)

      connection = Faraday.new(options) do |c|
        c.use Faraday::Request::UrlEncoded                  # encode request params as "www-form-urlencoded"
        c.use FaradayMiddleware::FollowRedirects, limit: 3
        c.use Faraday::Response::RaiseError                 # raise exceptions on 40x, 50x responses

        c.response :xml, :content_type => /\bxml$/
        c.response :json, :content_type => /\bjson$/

        c.adapter Faraday.default_adapter
      end

      connection.headers[:user_agent] = Readability.user_agent

      connection
    end
  end # Connection
end
