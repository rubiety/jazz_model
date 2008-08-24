# == Scale Tones REST API
# 
# Accesses scale tones within a scale context.  Similar to scale notes except 
# scale tones gives more detailed information about one member of a scale, whereas 
# scale notes simply gives the note value only (which is more useful for most purposes).
# 
# See +ScaleNotesController+.
# 
class ScaleTonesController < ApplicationController
	before_filter :find_scale_tones, :only => [:index]
	before_filter :find_scale_tone, :except => [:index, :new, :create]
	
  # GET /scale/Cmaj7/tones
  # GET /scale/Cmaj7/tones.xml
	# GET /scale/Cmaj7/tones.js
  def index
    respond_to do |format|
      format.html
      format.xml { render :xml => @scale_tones.to_xml }
			format.js { render :text => @scale_tones.to_json }
    end
  end
	
  # GET /scale/Cmaj7/1  (Where 1 is position)
  # GET /scale/Cmaj7/1.xml
	# GET /scale/Cmaj7/1.js
  def show
    respond_to do |format|
      format.html
      format.xml { render :xml => @scale_tone.to_xml }
			format.js { render :text => @scale_tone.to_json }
    end
  end
	
	
	protected
	
	def find_scale_tones
		find_scale
		
		@scale_tones = @scale.tones.all
	end
	
	def find_scale_tone
		find_scale
		
		@scale_tone = @scale.tones.all.detect {|ct| ct.position.to_s == params[:id]}
	end
	
	def find_scale
		@scale = Scale[params[:scale_id]]
	end
end
