require File.dirname(__FILE__) + '/../spec_helper'

describe ToneSequence do
  before(:each) do
    @chord = Chord['Cmaj7']
  end
	
  it "should should accept key context" do
    @chord.tones.in_key_of('F').notes.first.should == 'F'
  end
  
  it "should yield all notes" do
    @chord.tones.all.first.position.should == 1
  end
  
  it "should accept mode context" do
    @chord.tones.in_mode(2).notes.first.should == 'E'
  end
  
end
