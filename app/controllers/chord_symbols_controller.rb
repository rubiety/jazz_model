# == Chord Symbols REST API
# 
# Accessible in two contexts:
# * Direct Context - Directly access all chord symbols.
# * Chord Context - Access chord symbols from a given chord.
# 
class ChordSymbolsController < ApplicationController
	before_filter :find_chord_symbols, :only => [:index]
	before_filter :find_chord_symbol, :except => [:index]
	
  # GET /chord_symbols
  # GET /chord_symbols.xml
	# GET /chord_symbols.js
  def index
    respond_to do |format|
      format.html
      format.xml { render :xml => @chord_symbols.to_xml(:include => [:chord]) }
			format.js { render :text => @chord_symbols.to_json(:include => [:chord]) }
    end
  end
	
  # GET /chord_symbols/maj7
  # GET /chord_symbols/maj7.xml
	# GET /chord_symbols/maj7.js
  def show
    respond_to do |format|
      format.html
      format.xml { render :xml => @chord_symbol.to_xml(:include => [:chord]) }
			format.js { render :text => @chord_symbol.to_json(:include => [:chord]) }
    end
  end
	
	
	protected
	
	def find_chord_symbols
		find_chord
		@chord_symbols = @chord ? @chord.symbols : ChordSymbol.find(:all)
	end
	
	def find_chord_symbol
		find_chord
		@chord_symbol = @chord ? @chord.symbols[params[:id]] : ChordSymbol[params[:id]]
	end
	
	def find_chord
		@chord = Chord[params[:chord_id]]
	end
end
