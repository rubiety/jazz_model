# A key represents a specific theoretic tone mapped to a pitch and a letter 
# index.  Keys are defined for all letters A-G and all sharp/flat values 
# within two semitons (e.g. Dbb, D Double-Flat enharmonic with C).
#
# Each key is associated an index between 0-11 to represent the actual pitch 
# within the chromatic scale.  
# Each key is also assigned a "letter index" which represents a relative letter 
# value.  This index is crucial as it disambiguates theoretical tone differences 
# such as Eb and D#.  Doing so also supports correct double-sharp and double-flat 
# interpretations which are rare but theoretically different from their enharmonic 
# counterparts.
# 
class Key < ActiveRecord::Base
	Letters = ['C' => 0, 'D' => 1, 'E' => 2, 'F' => 3, 'G' => 4, 'A' => 5, 'B' => 6]
	
	# Retreives Fully-Cached Array
	def self.cache(conditions = [])
		self.find(:all, :conditions => []) # Rails 2.0 Already Caches!
	end
	
	# Finds a key given a tonal index 0-11 and a letter index (to disambiguate enharmonic keys)
	def self.from_index(value, preferred_letter = nil)
		self.cache.find {|k| k.index == value && (preferred_letter.nil? || k.letter_index == preferred_letter)}
	end
	
	# Finds a key object given the name (such as Eb)
	def self.from_name(value)
		self.cache.find {|k| k.name == value}
	end
	
	# Finds a key object based on the name:
	# +Key['Eb']+
	# 
	def self.[](value)
		self.from_name(value) || self.from_index(value)
	end
	
	# Returns an array of the 12 primary keys (definitions around the cycle of fourths)
	def self.primaries
		self.find_all_by_primary(true)
	end
	
	DEFAULT = self['C']
	
	# Tests whether the current key is enharmonic with +another_key+.
	def enharmonic_with?(another_key)
		self.index == another_key.index
	end
	
end
