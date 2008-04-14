require File.dirname(__FILE__) + '/../spec_helper'

describe ScaleTone do
  before(:each) do
    @scale_tone = ScaleTone.new
  end
	
  it "should be valid" do
    @scale_tone.should be_valid
  end
end
