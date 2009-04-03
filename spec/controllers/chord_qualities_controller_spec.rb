require File.dirname(__FILE__) + '/../spec_helper'

describe ChordQualitiesController do
  before do
		@request.env["HTTP_ACCEPT"] = "application/xml"
	end
	
	describe "on GET to index" do
	  before { get :index }
	  it { should respond_with(:success) }
	end
	
	describe "on GET to show" do
	  before { get :show, :id => 'Major' }
	  it { should respond_with(:success) }
	end
end
