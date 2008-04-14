# == Scales REST API
# 
# Acesses scales available in direct context only.
# 
class ScalesController < ApplicationController
	before_filter :get_scales, :only => [:index]
	before_filter :get_scale, :except => [:index]
	
  # GET /scales
  # GET /scales.xml
	# GET /scales.js
  def index
    respond_to do |format|
      format.html
      format.xml { render :xml => @scales.to_xml }
			format.js { render :text => @scales.to_json }
    end
  end
	
  # GET /scales/major
  # GET /scales/major.xml
	# GET /scales/major.js
  def show
    @scale = Scale[params[:id]]
		
    respond_to do |format|
      format.html
      format.xml { render :xml => @scale.to_xml }
			format.js { render :text => @scale.to_json }
    end
  end
	
	
	private
	
	def get_scales
		@scales = Scale.find(:all)
	end
	
	def get_scale
		@scale = Scale[params[:id]]
	end
	
end
