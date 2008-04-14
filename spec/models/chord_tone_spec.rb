require File.dirname(__FILE__) + '/../spec_helper'

describe ChordTone do
  before(:each) do
    @chord_tone = ChordTone.new
  end

  it "should be valid" do
    @chord_tone.should be_valid
  end
end
