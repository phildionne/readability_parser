require 'readability/configuration'
require 'readability/client'

module Readability
  extend Configuration
  class << self
    # Alias for Readability::Client.new
    #
    # @return [Readability::Client]
    def new(options={})
      Readability::Client.new(options)
    end

    # Delegate to Readability::Client
    def method_missing(method, *args, &block)
      return super unless new.respond_to?(method)
      new.send(method, *args, &block)
    end

    def respond_to?(method, include_private=false)
      new.respond_to?(method, include_private) || super(method, include_private)
    end
  end
end # Readability
