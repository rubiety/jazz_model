require File.dirname(__FILE__) + '/../spec_helper'

describe Voicing do
  before(:each) do
    @voicing = Voicing.new
  end

  it "should be valid" do
    @voicing.should be_valid
  end
end
