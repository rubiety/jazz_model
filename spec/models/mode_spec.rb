require File.dirname(__FILE__) + '/../spec_helper'

describe Mode do
  before(:each) do
    @mode = Scale['CMajor'].modes['Dorian']
  end
  
  it "should yield notes" do
    @mode.notes.should == ['D', 'E', 'F', 'G', 'A', 'B', 'C']
  end
end
