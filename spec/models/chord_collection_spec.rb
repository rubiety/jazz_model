require File.dirname(__FILE__) + '/../spec_helper'

describe ChordCollection do
  before do
    @chords = Scale['Major'].modes[1].chords
  end
	
  it "should emit symbols list" do
    @chords.to_s(:symbols).should be_starts_with('maj')
  end
  
  it "should emit names list" do
    @chords.to_s(:names).should be_starts_with('Major')
  end
  
  it "should resolve chord within" do
    @chords['maj'].should_not be_nil
  end
  
  it "should resolve chord within with key context" do
    @chords['Cmaj'].should_not be_nil
  end
end
