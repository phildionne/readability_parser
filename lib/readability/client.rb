require 'readability/connection'
require 'readability/request'
require 'readability/api/content'
require 'readability/article'


module Readability
  class Client
    attr_accessor *Configuration::VALID_CONFIG_KEYS

    def initialize(options={})
      options = Readability.options.merge(options)
      Configuration::VALID_OPTIONS_KEYS.each do |key|
        send("#{key}=", options[key])
      end
    end

    include Readability::Connection
    include Readability::Request
    include Readability::API::Content
  end # Client
end
