require File.dirname(__FILE__) + '/../spec_helper'

describe ChordQualitiesController do

  before(:each) do
		@request.env["HTTP_ACCEPT"] = "application/xml"
	end
	
	it "should list chord qualities" do
		get :index
		response.should be_success
	end
	
	it "should show chord quality" do
		get :show, :id => 'Major'
		response.should be_success
	end
	
end
