# == Modes REST API
# 
# Accessible only within scale context.  Represents the defined modes of 
# a given scale.
# 
class ModesController < ApplicationController
	before_filter :get_modes, :only => [:index]
	before_filter :get_mode, :except => [:index]
	
	# GET /scales/major/modes
  # GET /scales/major/modes.xml
	# GET /scales/major/modes.js
  def index
    respond_to do |format|
      format.html
      format.xml { render :xml => @modes.to_xml }
			format.js { render :text => @modes.to_json }
    end
  end
	
  # GET /scales/major/modes/1
  # GET /scales/major/modes/1.xml
	# GET /scales/major/modes/1.js
  def show
    respond_to do |format|
      format.html
      format.xml { render :xml => @mode.to_xml }
			format.js { render :text => @mode.to_json }
    end
  end
	
	
	protected
	
	def get_modes
		get_relateds
		@modes = case
		when @scale then @scale.modes
		when @chord then @chord.modes
		else Mode.find(:all)
		end
	end
	
	def get_mode
		get_relateds
		@mode = @scale.modes[params[:id]]
	end
	
	def get_relateds
		@scale = Scale[params[:scale_id]] if params[:scale_id]
		@chord = Chord[params[:chord_id]] if params[:chord_id]
	end
	
end
