require File.dirname(__FILE__) + '/../spec_helper'

describe ChordQuality do
	subject { ChordQuality.new }
	
	it { should be_valid }
	
	context "of Major" do
	  subject { ChordQuality.find_by_name('Major') }
    it { should be_valid }
	end
	
	context "of Minor" do
	  subject { ChordQuality.find_by_name('Minor') }
	  it { should be_valid }
	end
	
	context "of Dominant" do
	  subject { ChordQuality.find_by_name('Dominant') }
	  it { should be_valid }
	end
	
	context "of Diminished" do
	  subject { ChordQuality.find_by_name('Diminished') }
	  it { should be_valid }
	end
end
