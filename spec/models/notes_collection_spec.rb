require File.dirname(__FILE__) + '/../spec_helper'

describe NotesCollection do
  it "should recognize invalid keys" do
    NotesCollection['C,E,G,H'].should have(3).keys
  end
  
  it "should accept key context" do
    NotesCollection['C,E,G,A'].in_key_of('A').should have(1).chords
  end
  
  pairings = {
    'A C E G' => %w[Amin7 C6]
  }
  
  pairings.each do |notes, chords|
    context "as #{notes}" do
      it "should give correct chords" do
        notes_collection = NotesCollection[notes]
  			notes_collection.should_not be_nil
  			notes_collection.chords.symbols.to_set.should == chords.to_set
      end
    end
  end
end
