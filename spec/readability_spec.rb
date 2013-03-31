require 'helper'

describe ReadabilityParser do

  after do
    ReadabilityParser.reset!
  end

  describe "#new" do
    it "is a ReadabilityParser::Client" do
      (ReadabilityParser.new).should be_a_kind_of(ReadabilityParser::Client)
    end
  end
end
