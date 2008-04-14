require File.dirname(__FILE__) + '/../spec_helper'

describe ChordSymbol do
  before(:each) do
    @chord_symbol = ChordSymbol.new
  end

  it "should be valid" do
    @chord_symbol.should be_valid
  end
end
