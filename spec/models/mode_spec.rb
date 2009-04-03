require File.dirname(__FILE__) + '/../spec_helper'

describe Mode do
  subject { Scale['CMajor'].modes['Dorian'] }
  
  it "should yield correct notes" do
    subject.notes.should == ['D', 'E', 'F', 'G', 'A', 'B', 'C']
  end
end
