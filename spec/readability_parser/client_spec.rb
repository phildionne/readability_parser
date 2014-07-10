require 'spec_helper'

describe ReadabilityParser::Client do

  after do
    ReadabilityParser.reset!
  end

  context "with module configuration" do
    before do
      ReadabilityParser.configure do |config|
        ReadabilityParser::Configuration::VALID_CONFIG_KEYS.each do |key|
          config.send("#{key}=", key)
        end
      end
    end

    it "inherits the module configuration" do
      ReadabilityParser::Configuration::VALID_CONFIG_KEYS.each do |key|
        expect(ReadabilityParser.send(:"#{key}")).to eq(key)
      end
    end
  end

  context "with class configuration" do
    before do
      @configuration = {
        api_token: '1234',
        format: :sriracha
      }
    end

    it "overrides the module configuration after initialization" do
      ReadabilityParser.configure do |config|
        @configuration.each do |key, value|
          config.send("#{key}=", value)
        end
      end

      ReadabilityParser::Configuration::VALID_OPTIONS_KEYS.each do |key|
        expect(ReadabilityParser.send(:"#{key}")).to eq(@configuration[key])
      end
    end
  end

  describe "#connection" do
    it "looks like Faraday connection" do
      expect(subject.send(:connection)).to respond_to(:run_request)
    end
  end

  describe "#request" do
    before { ReadabilityParser.api_token = '1234' }

    it "catches Faraday connection errors" do
      skip
    end

    it "catches Readability Parser API errors" do
      skip
    end
  end
end
