require File.dirname(__FILE__) + '/../spec_helper'

describe Key do
  before(:each) do
    @key = Key.new
  end
	
  it "should default to C" do
    Key::DEFAULT.name.should == "C"
  end
	
	it "should expose 12 primary keys" do
		Key.primaries.size.should == 12
	end
	
	it "should treat Eb and D# as enharmonic" do
		Key['Eb'].should be_enharmonic_with(Key['D#'])
	end
	
	it "should cache items" do
		Key.cache.size.should == Key.count
	end
end
