ActionController::Routing::Routes.draw do |map|
	map.root :controller => 'main'
	
  map.resources :chord_qualities do |chord_qualities|
		chord_qualities.resources :chords do |chords|
			chords.resources :notes, :controller => :chord_notes
		end
	end
	
  map.resources :scales do |scales|
		scales.resources :modes do |modes|
			modes.resources :chords
		end
		
		scales.resources :chords
		scales.resources :tones, :controller => :scale_tones
		scales.resources :notes, :controller => :scale_notes
	end
	
  map.resources :chords do |chords|
		chords.resources :symbols, :controller => :chord_symbols
		chords.resources :voicings, :controller => :voicings
		chords.resources :modes, :controller => :modes
		
		chords.resources :tones, :controller => :chord_tones
		chords.resources :notes, :controller => :chord_notes
	end
	
	map.resources :notes_collection do |notes_collection|
		notes_collection.resources :chords
	end
	
	map.resources :voicings
	
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
