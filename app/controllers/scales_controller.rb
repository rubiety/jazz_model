# == Scales REST API
# 
# Acesses scales available in direct context only.
# 
class ScalesController < JazzController
	before_filter :find_scales, :only => [:index]
	before_filter :find_scale, :except => [:index]
	
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
	
	def find_scales
		@scales = Scale.find(:all)
	end
	
	def find_scale
		@scale = Scale[params[:id]]
	end
	
end
