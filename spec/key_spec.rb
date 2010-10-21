require "spec_helper"

describe JazzModel::Key do
  it "should default to C" do
    JazzModel::Key.default.name.should == "C"
  end
  
  it "should expose 12 primary keys" do
    JazzModel::Key.should have(12).primaries
  end
  
  it "should treat Eb and D# as enharmonic" do
    JazzModel::Key['Eb'].should be_enharmonic_with(JazzModel::Key['D#'])
  end
end
