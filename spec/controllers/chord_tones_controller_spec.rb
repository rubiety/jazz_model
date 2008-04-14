require File.dirname(__FILE__) + '/../spec_helper'

describe ChordTonesController do
	
  before(:each) do
		@request.env["HTTP_ACCEPT"] = "application/xml"
	end
	
	it "should list chord tones" do
		get :index, :chord_id => 'C7'
		response.should be_success
	end
	
	it "should show chord tone" do
		get :show, :chord_id => 'C7', :id => 1
		response.should be_success
	end
	
end
