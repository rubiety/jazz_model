require File.dirname(__FILE__) + '/../spec_helper'

describe Key do
  it "should default to C" do
    Key::DEFAULT.name.should == "C"
  end
	
	it "should expose 12 primary keys" do
		Key.should have(12).primaries
	end
	
	it "should treat Eb and D# as enharmonic" do
		Key['Eb'].should be_enharmonic_with(Key['D#'])
	end
end
