require 'readability_parser/connection'
require 'readability_parser/request'
require 'readability_parser/api/content'
require 'readability_parser/article'

module ReadabilityParser
  class Client
    attr_accessor *Configuration::VALID_CONFIG_KEYS

    def initialize(options = {})
      options = ReadabilityParser.options.merge(options)
      Configuration::VALID_OPTIONS_KEYS.each do |key|
        send("#{key}=", options[key])
      end
    end

    include ReadabilityParser::Connection
    include ReadabilityParser::Request
    include ReadabilityParser::API::Content
  end # Client
end
