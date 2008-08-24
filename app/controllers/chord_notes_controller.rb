# == Chord Notes REST API
# 
# Used within a "Chord" resource context to access notes 
# from the chord.
# 
class ChordNotesController < ApplicationController
	before_filter :find_chord_notes, :only => [:index]
	before_filter :find_chord_note, :except => [:index]
	
  # GET /chord/Cmaj7/notes
  # GET /chord/Cmaj7/notes.xml
	# GET /chord/Cmaj7/notes.js
  def index
    respond_to do |format|
      format.html
      format.xml { render :xml => @chord_notes.to_xml }
			format.js { render :text => @chord_notes.to_json }
    end
  end
	
  # GET /chord/Cmaj7/notes/1  (Where 1 is position in chord)
  # GET /chord/Cmaj7/notes/1.xml
	# GET /chord/Cmaj7/notes/1.js
  def show
    respond_to do |format|
      format.html
      format.xml { render :xml => '<note>' + @chord_note + '</note>' }
			format.js { render :text => @chord_note }
    end
  end
	
	
	protected
	
	def find_chord_notes
		get_chord
		@chord_notes = @chord.notes
	end
	
	def find_chord_note
		get_chord
		get_chord_notes
		@chord_note = @chord.notes[params[:id].to_i + 1]
	end
	
	def find_chord
		@chord = Chord[params[:chord_id]]
	end
	
end
