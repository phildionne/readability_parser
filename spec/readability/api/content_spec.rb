require 'helper'

describe Readability::API::Content do

  before do
    @client = Readability::Client.new(:api_token => '12345678910')
  end

  after do
    Readability.reset
  end

  describe ".parse" do
    it "fetches the content of a given uri" do
      pending
    end

    it "returns a Readability::Article" do
      pending
    end
  end

end