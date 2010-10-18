require "spec_helper"

describe JazzModel::ChordCollection do
  subject { JazzModel::Scale['Major'].modes[1].chords }
  
  it "should emit symbols list" do
    subject.to_s(:symbols).should be_starts_with('maj')
  end
  
  it "should emit names list" do
    subject.to_s(:names).should be_starts_with('Major')
  end
  
  it "should resolve chord within" do
    subject['maj'].should_not be_nil
  end
  
  it "should resolve chord within with key context" do
    subject['Cmaj'].should_not be_nil
  end
end
