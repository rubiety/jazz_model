require File.dirname(__FILE__) + '/../spec_helper'

describe ModesController do
  before do
		@request.env["HTTP_ACCEPT"] = "application/xml"
	end
	
	describe "on GET to index" do
	  before { get :index }
	  it { should respond_with(:success) }
	end
	
	context "in scale context" do
	  describe "on GET to index" do
	    before { get :index, :scale_id => 'Major' }
	    it { should respond_with(:success) }
	  end
	  
	  describe "on GET to show" do
	    before { get :show, :scale_id => 'Major', :id => 1}
	    it { should respond_with(:success) }
	  end
	end
end
