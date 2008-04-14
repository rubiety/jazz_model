require File.dirname(__FILE__) + '/../spec_helper'

describe KeyContext do
  before(:each) do
    @chord = Chord['maj7']
    @chord_in_f = Chord['Fmaj7']
  end
	
	describe "chord without context" do
    it "should accept key context" do
      @chord.in_key_of('G').key.name.should == 'G'
    end
    
    it "should should accept then remove key context" do
      @chord.in_key_of('G').without_key.key.should be_nil
    end
  end
  
  describe "chord with context" do
    it "should have correct context" do
      @chord_in_f.key.name.should == 'F'
    end
    
    it "should be put out of context" do
      @chord_in_f.without_key.key.should be_nil
    end
  end
end
