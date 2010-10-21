require "spec_helper"

describe JazzModel::ChordQuality do
  subject { JazzModel::ChordQuality.new }
  
  it { should be_valid }
  
  context "of Major" do
    subject { JazzModel::ChordQuality.find_by_name('Major') }
    it { should be_valid }
  end
  
  context "of Minor" do
    subject { JazzModel::ChordQuality.find_by_name('Minor') }
    it { should be_valid }
  end
  
  context "of Dominant" do
    subject { JazzModel::ChordQuality.find_by_name('Dominant') }
    it { should be_valid }
  end
  
  context "of Diminished" do
    subject { JazzModel::ChordQuality.find_by_name('Diminished') }
    it { should be_valid }
  end
end
