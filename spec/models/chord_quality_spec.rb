require File.dirname(__FILE__) + '/../spec_helper'

describe ChordQuality do
	before(:each) do
		@chord_quality = ChordQuality.new
	end
	
	it "should be valid" do
		@chord_quality.should be_valid
	end
end

describe ChordQuality, "of Major" do
  before(:each) do
    @chord_quality = ChordQuality.find_by_name('Major')
  end
	
  it "should be valid" do
    @chord_quality.should be_valid
  end
end

describe ChordQuality, "of Minor" do
	before(:each) do
		@chord_quality = ChordQuality.find_by_name('Minor')
	end
	
	it "should be valid" do
		@chord_quality.should be_valid
	end
end

describe ChordQuality, "of Dominant" do
	before(:each) do
		@chord_quality = ChordQuality.find_by_name('Dominant')
	end
	
	it "should be valid" do
		@chord_quality.should be_valid
	end
end

describe ChordQuality, "of Diminished" do
	before(:each) do
		@chord_quality = ChordQuality.find_by_name('Diminished')
	end
	
	it "should be valid" do
		@chord_quality.should be_valid
	end
end
