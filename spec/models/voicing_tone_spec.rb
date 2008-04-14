require File.dirname(__FILE__) + '/../spec_helper'

describe VoicingTone do
  before(:each) do
    @voicing_tone = VoicingTone.new
  end

  it "should be valid" do
    @voicing_tone.should be_valid
  end
end
