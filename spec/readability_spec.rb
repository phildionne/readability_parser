require 'helper'

describe Readability do

  after do
    Readability.reset
  end

  describe ".new" do
    it "is a Readability::Client" do
      (Readability.new).should be_a_kind_of(Readability::Client)
    end
  end

  describe ".method_missing?" do
    pending
  end

  describe ".respond_to?" do
    pending
  end
end
