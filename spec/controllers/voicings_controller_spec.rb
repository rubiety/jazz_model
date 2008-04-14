require File.dirname(__FILE__) + '/../spec_helper'

describe VoicingsController do
	
	before(:each) do
		@request.env["HTTP_ACCEPT"] = "application/xml"
	end
	
end
