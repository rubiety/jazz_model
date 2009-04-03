require File.dirname(__FILE__) + '/../spec_helper'

describe Chord do
  subject { Chord.new }
	
	it { should be_valid }
	
	pairings = {
	  'Cmaj' => %w[C E G],
	  'Cmin' => %w[C Eb G],
	  'Cmaj7' => %w[C E G B],
	  'Cmin7' => %w[C Eb G Bb],
	  'C7' => %w[C E G Bb],
	  'Cfulldim' => %w[C Eb Gb Bbb]
	}
	
	pairings.each do |chord_symbol, notes|
	  context "as #{chord_symbol}" do
	    it "should give valid notes" do
	      chord = Chord[chord_symbol]
	      chord.should_not be_nil
	      chord.notes.should == notes
	    end
	  end
	end
end



