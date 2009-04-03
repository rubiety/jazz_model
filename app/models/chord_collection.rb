# Intended to be used as a dynamic object extension of an Array representing 
# a collection of chords for some added convenience.
# 
# For example, even though the base class is an Array, we can write:
# 
# * +scale.chords.symbols+ - For an array of symbols.
# * +scale.chords.names+ - For an array of full names.
# 
module ChordCollection
	
	# Formats chord collection
	def to_s(format = :symbols)
		case format
		when :symbols then symbols.join(', ')
		when :names then names.join(', ')
		end
	end
	
	# Returns array of chord symbols only
	def symbols
		self.map {|c| "#{c.key.name if c.key}#{c.primary_symbol.name}" }
	end
	
	# Returns array of chord names only
	def names
		self.map {|c| "#{c.key.name if c.key} #{c.name}".strip }
	end
	
	
	# WARNING: This is basically duplicated from Chord
	# Try to make this DRY!
	# 
	# Resolves a chord symbol into a chord.
	# Implementation is somewhat flakey due to the potential ambiguities arising 
	# from specifying key and symbols together.
	def resolve(symbol)
		in_key = nil
	  
		return nil if symbol.nil?
		
		Key.all.each do |k|
			if symbol.starts_with?(k.name)
				in_key = k
				symbol.sub!(k.name, '').strip
				break
			end
		end
		
		chord_symbol = self.map {|c| c.symbols.to_a}.flatten.detect {|cs| cs.name == symbol}
		
		# Perhaps the matched key was really part of the name of the chord, try that:
		if chord_symbol.nil? && !in_key.nil?
			symbol = in_key.name + symbol
			chord_symbol = self.symbols[symbol]
		end
		
		# If still not found, must be invalid:
		return nil if chord_symbol.nil?
		
		chord = chord_symbol.chord
		chord.key = in_key unless in_key.nil?
		chord
	end
	alias_method :[], :resolve
	
end
