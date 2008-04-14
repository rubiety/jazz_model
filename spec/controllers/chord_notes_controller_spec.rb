require File.dirname(__FILE__) + '/../spec_helper'

describe ChordNotesController do

  before(:each) do
		@request.env["HTTP_ACCEPT"] = "application/xml"
	end
	
	it "should list chord notes" do
		get :index, :chord_id => 'Cmaj7'
		response.should be_success
	end
	
	it "should show chord tone" do
		get :show, :chord_id => 'Cmaj7', :id => 1
		response.should be_success
	end
	
end
