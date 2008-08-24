# == Chord Tones REST API
# 
# Accesses chord tones within a chord context.  Similar to chord notes 
# except chord tones provides more semantic information.  Chord notes 
# can be considered a subresource (note-specific information) of chord tones.
# Chord notes gives only the actual note values (which is more useful for 
# most purposes).
# 
# See +ChordNotesController+.
# 
class ChordTonesController < ApplicationController
	before_filter :find_chord_tones, :only => [:index]
	before_filter :find_chord_tone, :except => [:index, :new, :create]
	
  # GET /chord/Cmaj7/tones
  # GET /chord/Cmaj7/tones.xml
	# GET /chord/Cmaj7/tones.js
  def index
    respond_to do |format|
      format.html
      format.xml { render :xml => @chord_tones.to_xml }
			format.js { render :text => @chord_tones.to_json }
    end
  end
	
  # GET /chord/Cmaj7/1  (Where 1 is position)
  # GET /chord/Cmaj7/1.xml
	# GET /chord/Cmaj7/1.js
  def show
    respond_to do |format|
      format.html
      format.xml { render :xml => @chord_tone.to_xml }
			format.js { render :text => @chord_tone.to_json }
    end
  end
	
	
	protected
	
	def find_chord_tones
		find_chord
		@chord_tones = @chord.tones.all
	end
	
	def find_chord_tone
		find_chord
		@chord_tone = @chord.tones.all.detect {|ct| ct.position.to_s == params[:id]}
	end
	
	def find_chord
		@chord = Chord[params[:chord_id]]
	end
	
	
end
