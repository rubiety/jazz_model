# == Chord Qualities REST API
# 
# Directly accessible API for chord qualities, which are currently 
# not used much within the system.
# 
class ChordQualitiesController < JazzController
  
  # GET /chord_qualities
  # GET /chord_qualities.xml
	# GET /chord_qualities.js
  def index
    @chord_qualities = ChordQuality.find(:all)
		
    respond_to do |format|
      format.html
      format.xml { render :xml => @chord_qualities.to_xml(:except => [:id]) }
			format.js { render :text => @chord_qualities.to_json(:except => [:id]) }
    end
  end
	
  # GET /chord_qualities/major
  # GET /chord_qualities/major.xml
	# GET /chord_qualities/major.js
  def show
    @chord_quality = ChordQuality[params[:id]]
		
    respond_to do |format|
      format.html
      format.xml { render :xml => @chord_quality.to_xml(:except => [:id]) }
			format.js { render :text => @chord_quality.to_json(:except => [:id]) }
    end
  end
	
end
