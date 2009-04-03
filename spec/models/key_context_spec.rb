require File.dirname(__FILE__) + '/../spec_helper'

describe KeyContext do
	describe "chord without context" do
	  subject { Chord['maj7'] } 
	  
    it "should accept key context" do
      subject.in_key_of('G').key.name.should == 'G'
    end
    
    it "should should accept then remove key context" do
      subject.in_key_of('G').without_key.key.should be_nil
    end
  end
  
  describe "chord with context" do
    subject { Chord['Fmaj7'] }
    
    it "should have correct context" do
      subject.key.name.should == 'F'
    end
    
    it "should be put out of context" do
      subject.without_key.key.should be_nil
    end
  end
end
