require File.dirname(__FILE__) + '/../spec_helper'

describe NotesCollection do
  
  it "should recognize invalid keys" do
    NotesCollection['C,E,G,H'].keys.size.should == 3
  end
  
  it "should accept key context" do
    NotesCollection['C,E,G,A'].in_key_of('A').chords.size.should == 1
  end
  
end

def notes_collection_should_give_correct_chords(notes_collection, chords, options = {})
	describe NotesCollection, "as #{notes_collection}" do
		it "should give correct chords" do
			notes_collection = NotesCollection[notes_collection]
			notes_collection.should_not be_nil
			notes_collection.in_key_of(options[:key]) if options[:key]
			notes_collection.chords.symbols.to_set.should == chords.to_set
		end
	end
end

# Doesn't test everything - just some basic ones and edge cases:
notes_collection_should_give_correct_chords "A C E G", %w[Amin7 C6]
