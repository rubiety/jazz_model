require File.dirname(__FILE__) + '/../spec_helper'

describe NotesCollectionController do
  before do
		@request.env["HTTP_ACCEPT"] = "application/xml"
	end
	
	describe "on GET to show" do
	  before { get :show, :id => 'C,E,G,A' }
	  it { should respond_with(:success) }
	end
end
