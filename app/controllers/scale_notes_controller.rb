# == Scale Notes REST API
# 
# Accessible within scale context only.  Represents notes in a given 
# scale.  See +ScaleTonesController+ for information about scale tones.
# 
class ScaleNotesController < JazzController
	before_filter :find_scale_notes, :only => [:index]
	before_filter :find_scale_note, :except => [:index, :new, :create]
	
  # GET /scale/Cmajor/notes
  # GET /scale/Cmajor/notes.xml
	# GET /scale/Cmajor/notes.js
  def index
    respond_to do |format|
      format.html
      format.xml { render :xml => @scale_notes.to_xml }
			format.js { render :text => @scale_notes.to_json }
    end
  end
	
  # GET /scale/Cmajor/notes/1  (Where 1 is position in scale)
  # GET /scale/Cmajor/notes/1.xml
	# GET /scale/Cmajor/notes/1.js
  def show
    respond_to do |format|
      format.html
      format.xml { render :xml => '<note>' + @scale_note + '</note>' }
			format.js { render :text => @scale_note }
    end
  end
	
	
	protected
	
	def find_scale_notes
		find_scale
		
		@scale_notes = @scale.notes
	end
	
	def find_scale_note
		find_scale
		find_scale_notes
		
		@scale_note = @scale_notes[params[:id].to_i]
	end
	
	def find_scale
		@scale = Scale[params[:scale_id]]
	end
	
end
