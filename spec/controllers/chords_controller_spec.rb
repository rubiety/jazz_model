require File.dirname(__FILE__) + '/../spec_helper'

describe ChordsController do
	before do
		@request.env["HTTP_ACCEPT"] = "application/xml"
	end

	it "should list chords" do
		get :index
		response.should be_success
	end

	it "should show a C7" do
		get :show, :id => 'C7'
		response.should be_success
	end
	
	describe "with mode context" do
		it "should list chords" do
		  get :index, :scale_id => 'Major', :mode_id => 'Dorian'
		  response.should be_success
	  end
	  
	  it "should list chords in key context" do
	    get :index, :scale_id => 'BbMajor', :mode_id => 'Dorian'
	    response.should be_success
    end
	end
	
	describe "with scale context" do
		it "should list chords" do
		  get :index, :scale_id => 'Major'
		  response.should be_success
	  end
	  
	  it "should list chords in key context" do
	    get :index, :scale_id => 'BbMajor'
	    response.should be_success
    end
	end
	
	describe "with notes collection context" do
		it "should list chords" do
			get :index, :notes_collection_id => 'C,E,G,A'
			response.should be_success
		end
		
		it "should list chords in key context" do
		  get :index, :notes_collection_id => ''
	  end
		
		it "should show chord" do
			get :index, :notes_collection_id => 'C,E,G,A', :id => 'min7'
			response.should be_success
		end
	end
end
