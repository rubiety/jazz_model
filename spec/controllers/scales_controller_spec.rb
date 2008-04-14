require File.dirname(__FILE__) + '/../spec_helper'

describe ScalesController do

  before(:each) do
		@request.env["HTTP_ACCEPT"] = "application/xml"
	end
	
	it "should list scales" do
		get :index
		response.should be_success
	end
	
	it "should show scale" do
		get :show, :id => 'Major'
		response.should be_success
	end
	
end
