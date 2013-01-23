require 'helper'

describe Readability::Configuration do

  after do
    Readability.reset
  end

  Readability::Configuration::VALID_CONFIG_KEYS.each do |key|
    describe ":#{key}" do
      it "should return the default value" do
        Readability.send(key).should be(Readability::Configuration.const_get("DEFAULT_#{key.upcase}"))
      end
    end
  end

end
