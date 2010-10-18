require "spec_helper"

describe Scale do
  subject { JazzModel::Scale['Major'] }
  
  it { should be_valid }
  
  it "should recognize symmetric scale" do
    JazzModel::Scale['Diminished'].should be_symmetric
  end
  
  it "should recognize asymmetric scale" do
    JazzModel::Scale['Major'].should_not be_symmetric
  end
  
  it "should accept numeric mode context" do
    subject.in_mode(2).notes.first.should == 'D'
  end
  
  it "should accept named mode context" do
    subject.in_mode('Dorian').notes.first.should == 'D'
  end
  
  it "should remove mode context" do
    subject.in_mode('Dorian').without_mode.notes.first.should == 'C'
  end
  
  pairings = {
    'C Major' => %w[C D E F G A B],
    'C Harmonic Minor' => %w[C D Eb F G Ab B]
  }
  
  pairings.each do |scale, notes|
    context "as #{scale}" do
      it "should give correct notes" do
        scale = Scale[scale]
        scale.should_not be_nil
        scale.notes.should == notes
      end
    end
  end
end
