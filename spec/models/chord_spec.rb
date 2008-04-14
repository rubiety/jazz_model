require File.dirname(__FILE__) + '/../spec_helper'

describe Chord do
  before(:each) do
    @chord = Chord.new
  end
	
  it "should be valid" do
    @chord.should be_valid
  end
end

def chord_should_give_correct_notes(chord_symbol, notes)
	describe Chord, "as #{chord_symbol}" do
		it "should give correct notes" do
			chord = Chord[chord_symbol]
			chord.should_not be_nil
			chord.notes.should == notes
		end
		
		yield if block_given?
	end
end

# Doesn't test everything - just some basic ones and edge cases:
chord_should_give_correct_notes "Cmaj", %w[C E G]
chord_should_give_correct_notes "Cmin", %w[C Eb G]
chord_should_give_correct_notes "Cmaj7", %w[C E G B]
chord_should_give_correct_notes "Cmin7", %w[C Eb G Bb]
chord_should_give_correct_notes "C7", %w[C E G Bb]
chord_should_give_correct_notes "Cfulldim", %w[C Eb Gb Bbb]


