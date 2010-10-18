require File.dirname(__FILE__) + '/../spec_helper'

describe JazzModel::ToneSequence do
  subject { JazzModel::Chord['Cmaj7'] }
  
  it "should should accept key context" do
    subject.tones.in_key_of('F').notes.first.should == 'F'
  end
  
  it "should yield all notes" do
    subject.tones.all.first.position.should == 1
  end
  
  it "should accept mode context" do
    subject.tones.in_mode(2).notes.first.should == 'E'
  end
end
