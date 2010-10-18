require "spec_helper"

describe JazzModel::Mode do
  subject { JazzModel::Scale['CMajor'].modes['Dorian'] }
  
  it "should yield correct notes" do
    subject.notes.should == ['D', 'E', 'F', 'G', 'A', 'B', 'C']
  end
end
