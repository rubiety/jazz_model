require File.dirname(__FILE__) + '/../spec_helper'

describe ChordScale do
  before(:each) do
    @chord_scale = ChordScale.new
  end
	
  it "should be valid" do
    @chord_scale.should be_valid
  end
end
