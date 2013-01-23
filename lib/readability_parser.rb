require 'readability_parser/configuration'
require 'readability_parser/client'

module ReadabilityParser
  extend Configuration
  class << self
    # Alias for ReadabilityParser::Client.new
    #
    # @return [ReadabilityParser::Client]
    def new(options={})
      ReadabilityParser::Client.new(options)
    end

    # Delegate to ReadabilityParser::Client
    def method_missing(method, *args, &block)
      return super unless new.respond_to?(method)
      new.send(method, *args, &block)
    end

    def respond_to?(method, include_private=false)
      new.respond_to?(method, include_private) || super(method, include_private)
    end
  end
end # ReadabilityParser
