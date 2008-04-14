# Module mixin for Chord symbols
module ChordSymbolCollection
	
	# WARNING: This is basically duplicated from ChordSymbol
	# Find way to make this DRY!
	# 
	# Finds a chord symbol
	def resolve(symbol)
		self.detect do |cs|
			cs.case_sensitive? ? (cs.name == symbol) : (cs.name.downcase == symbol.downcase)
		end
	end
	alias_method :[], :resolve
	
end