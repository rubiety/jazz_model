require File.dirname(__FILE__) + '/../spec_helper'

describe ChordTonesController do
  before do
		@request.env["HTTP_ACCEPT"] = "application/xml"
	end
	
	describe "on GET to index" do
	  before { get :index, :chord_id => 'C7' }
    it { should respond_with(:success) }
	end
	
	describe "on GET to show" do
	  before { get :show, :chord_id => 'C7', :id => 1}
	  it { should respond_with(:success) }
	end
end
