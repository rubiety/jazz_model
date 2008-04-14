require File.dirname(__FILE__) + '/../spec_helper'

describe MainController do
	
	it "should get home page" do
		get :index
		
	end
	
end
