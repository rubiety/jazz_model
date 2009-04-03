require File.dirname(__FILE__) + '/../spec_helper'

describe Scale do
  before(:each) do
    @scale = Scale['Major']
  end
  
  it "should be valid" do
    @scale.should be_valid
  end
  
  it "should recognize symmetric scale" do
    Scale['Diminished'].should be_symmetric
  end
  
  it "should recognize asymmetric scale" do
    Scale['Major'].should_not be_symmetric
  end
  
  it "should accept numeric mode context" do
    @scale.in_mode(2).notes.first.should == 'D'
  end
  
  it "should accept named mode context" do
    @scale.in_mode('Dorian').notes.first.should == 'D'
  end
  
  it "should remove mode context" do
    @scale.in_mode('Dorian').without_mode.notes.first.should == 'C'
  end
end

def scale_should_give_correct_notes(scale_name, notes)
	describe Scale, "as #{scale_name}" do
		it "should give correct notes" do
			scale = Scale[scale_name]
			scale.should_not be_nil
			scale.notes.should == notes
		end
		
		yield if block_given?
	end
end

# Doesn't test everything - just some basic ones and edge cases:
scale_should_give_correct_notes "C Major", %w[C D E F G A B]
scale_should_give_correct_notes "C Harmonic Minor", %w[C D Eb F G Ab B]
