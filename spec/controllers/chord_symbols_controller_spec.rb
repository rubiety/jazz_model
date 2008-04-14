require File.dirname(__FILE__) + '/../spec_helper'

describe ChordSymbolsController do

  before(:each) do
		@request.env["HTTP_ACCEPT"] = "application/xml"
	end
	
	it "should list chord symbols" do
		get :index
		response.should be_success
	end
	
	it "should show chord symbol" do
		get :show, :id => 'maj7'
		response.should be_success
	end
	
	
	describe "with chord context" do
		it "should list chord symbols" do
			get :index, :chord_id => 'maj7'
			response.should be_success
		end
		
		it "should show chord symbol" do
			get :index, :chord_id => 'maj7', :id => 'maj7'
			response.should be_success
		end
		
		it "should show chord symbol with key context" do
			get :index, :chord_id => 'Cmaj7', :id => 'maj7'
			response.should be_success
		end
	end
	
end
