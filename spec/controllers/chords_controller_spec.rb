require File.dirname(__FILE__) + '/../spec_helper'

describe ChordsController do
	before do
		@request.env["HTTP_ACCEPT"] = "application/xml"
	end
  
  describe "on GET to index" do
	  before { get :index }
	  it { should respond_with(:success) }
	end
	
	describe "on GET to show" do
	  before { get :show, :id => 'C7' }
	  it { should respond_with(:success) }
	end
	
	context "with scale context" do
	  describe "on GET to index" do
  	  before { get :index, :scale_id => 'Major' }
  	  it { should respond_with(:success) }
  	end
	  
	  context "and key context" do
	    describe "on GET to index" do
    	  before { get :index, :scale_id => 'BbMajor' }
    	  it { should respond_with(:success) }
    	end
    end
    
    context "with mode context" do
  	  describe "on GET to index" do
    	  before { get :index, :scale_id => 'Major', :mode_id => 'Dorian' }
    	  it { should respond_with(:success) }
    	end

  	  context "and key context" do
  	    describe "on GET to index" do
      	  before { get :index, :scale_id => 'BbMajor', :mode_id => 'Dorian' }
      	  it { should respond_with(:success) }
      	end
      end
  	end
	end
	
	context "with notes collection context" do
	  describe "on GET to index" do
	    before { get :index, :notes_collection_id => 'C,E,G,A' }
	    it { should respond_with(:success) }
	  end
	  
	  describe "on GET to show" do
	    before { get :show, :notes_collection_id => 'C,E,G,A', :id => 'min7' }
	    it { should respond_with(:success) }
	  end
	  
	  context "and key context" do
	    it "should define specs"
	  end
	end
end
