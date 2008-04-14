require File.dirname(__FILE__) + '/../spec_helper'

describe ModesController do

  before(:each) do
		@request.env["HTTP_ACCEPT"] = "application/xml"
	end
	
	it "should list all modes" do
	  get :index
	  response.should be_success
  end
	
	it "should lists scale modes" do
		get :index, :scale_id => 'Major'
		response.should be_success
	end
	
	it "should shows a scale mode" do
		get :show, :scale_id => 'Major', :id => 1
		response.should be_success
	end
	
end
