require 'readability_parser/version'

module ReadabilityParser
  module Configuration
    VALID_CONNECTION_KEYS = [:api_endpoint, :user_agent].freeze
    VALID_OPTIONS_KEYS    = [:api_token, :format].freeze
    VALID_CONFIG_KEYS     = VALID_CONNECTION_KEYS + VALID_OPTIONS_KEYS

    DEFAULT_API_ENDPOINT  = "https://readability.com/api/content/v1/parser"
    DEFAULT_USER_AGENT    = "ReadabilityParser Ruby Gem #{ReadabilityParser::VERSION}".freeze
    DEFAULT_API_TOKEN     = nil
    DEFAULT_FORMAT        = :json

    attr_accessor *VALID_CONFIG_KEYS

    def self.extended(base)
      base.reset!
    end

    # Convenience method to allow configuration options to be set in a block
    def configure
      yield self
    end

    def options
      Hash[ * VALID_CONFIG_KEYS.map { |key| [key, send(key)] }.flatten ]
    end

    def reset!
      self.api_endpoint = DEFAULT_API_ENDPOINT
      self.user_agent   = DEFAULT_USER_AGENT

      self.api_token    = DEFAULT_API_TOKEN
      self.format       = DEFAULT_FORMAT

      return true
    end
  end # Configuration
end
