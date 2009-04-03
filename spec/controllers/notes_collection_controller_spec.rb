require File.dirname(__FILE__) + '/../spec_helper'

describe NotesCollectionController do
  before do
		@request.env["HTTP_ACCEPT"] = "application/xml"
	end
	
	it "should show notes" do
		get :show, :id => 'C,E,G,A'
		response.should be_success
	end
end
