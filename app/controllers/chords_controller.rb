# == Chords REST API
# 
# Could be referenced in many RESTful contexts:
# * +Mode+ - See chords related to a given mode.
# * +Scale+ (Delegated to Main Mode of Scale) - See chords related to the main mode of a scale.
# * +NotesCollection+ - Shows potential chord matches with a NotesCollection.
# 
class ChordsController < JazzController
	before_filter :find_chords, :only => [:index]
	before_filter :find_chord, :except => [:index]
	
  # GET /chords
  # GET /chords.xml
	# GET /chords.js
  def index
    respond_to do |format|
      format.html
      format.xml { render :xml => @chords.to_xml(:skip_types => true, :methods => [:symbols_list], :except => [:id, :parent_id, :chord_quality_id]) }
			format.js { render :text => @chords.to_json(:except => [:id, :parent_id, :chord_quality_id]) }
    end
  end
	
  # GET /chords/maj7
  # GET /chords/maj7.xml
	# GET /chords/maj7.js
  def show
    respond_to do |format|
      format.html
      format.xml { render :xml => @chord.to_xml(:skip_types => true, :methods => [:symbols_list], :except => [:id, :chord_quality_id, :parent_id], :include => [:chord_quality, :parent]) }
			format.js { render :text => @chord.to_json(:except => [:id, :chord_quality_id, :parent_id], :include => [:parent]) }
    end
  end
	
	
	protected
	
	def find_chords
		find_relateds
		
		@chords = case 
		  when @mode then @mode.chords
	    when @scale then @scale.chords
		  when @chord_quality then @chord_quality.chords
		  when @notes_collection then @notes_collection.chords
		  else Chord.find(:all, :include => [:symbols])
		end
	end
	
	def find_chord
		find_relateds
		
		@chord = case
		  when @mode then @mode.chords[params[:id]]
		  when @scale then @scale.chords[params[:id]]
		  when @chord_quality then @chord_quality.chords[params[:id]]
		  when @notes_collection then @notes_collection.chords[params[:id]]
		  else Chord[params[:id]]
		end
	end
	
	def find_relateds
		@scale = Scale[params[:scale_id]] if params[:scale_id]
		@mode = @scale.modes[params[:mode_id]] if params[:mode_id] and @scale
		@chord_quality = ChordQuality[params[:chord_quality_id]] if params[:chord_quality_id]
		@notes_collection = NotesCollection[params[:notes_collection_id]] if params[:notes_collection_id]
	end
	
end
