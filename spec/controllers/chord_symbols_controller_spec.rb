require File.dirname(__FILE__) + '/../spec_helper'

describe ChordSymbolsController do
  before do
		@request.env["HTTP_ACCEPT"] = "application/xml"
	end
	
	describe "on GET to index" do
	  before { get :index }
	  it { should respond_with(:success) }
	end
	
	describe "on GET to show" do
	  before { get :show, :id => 'maj7' }
	  it { should respond_with(:success) }
	end
	
	
	context "with chord context" do
	  describe "on GET to index" do
  	  before { get :index, :chord_id => 'maj7' }
  	  it { should respond_with(:success) }
  	end
	  
	  describe "on GET to show" do
  	  before { get :show, :chord_id => 'maj7', :id => 'maj7' }
  	  it { should respond_with(:success) }
  	end
  	
  	context "and key context" do
  	  describe "on GET to show" do
    	  before { get :show, :chord_id => 'Cmaj7', :id => 'maj7' }
    	  it { should respond_with(:success) }
    	end
  	end
	end
end
