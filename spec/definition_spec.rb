require "spec_helper"

describe JazzModel::Definition do
  context "after creating a definition" do
    before(:all) do
      JazzModel::Definition.define :my_definition => [:keys] do
        JazzModel::Scale.create!(:name => "Sample")
      end
    end
    
    it "should have registered my_definition" do
      JazzModel::Definition[:my_definition].should_not be_nil
    end
    
    describe "the definition" do
      before { @definition = JazzModel::Definition[:my_definition] }
      
      it "should list keys as an included_definition" do
        @definition.included_definitions.should include(:keys)
      end
      
      context "when loaded" do
        before { @definition.load }
        
        it "should create keys" do
          JazzModel::Key.find_by_name("C").should_not be_nil
        end
        
        it "should create sample scale" do
          JazzModel::Scale.find_by_name("Sample").should_not be_nil
        end
      end
    end
  end
end