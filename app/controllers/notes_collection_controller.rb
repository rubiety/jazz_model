# == Notes Collection REST API
# 
# Experimental REST resource. A notes collection represents a comma-separated 
# list of notes.  Subresources of notes collection can reveal potential matches. 
# Right now, the only implemented subresource is "chords" which lists chords (directly,
# or any inversion thereof) that have a direct match to the list of notes provided.
# 
class NotesCollectionController < JazzController
  
  # GET /notes_collection/C,E,G,A
  # GET /notes_collection/C,E,G,A.xml
	# GET /notes_collection/C,E,G,A.js
  def show
    @notes_collection = NotesCollection[params[:id]]
		
    respond_to do |format|
      format.html
      format.xml { render :xml => @notes_collection.to_xml }
			format.js { render :text => @notes_collection.to_json }
    end
  end
end
