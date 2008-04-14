# Represents one tone in a scale.  
# 
# == Attributes
# 
# * +tone+ - A tone index from 0-11 representing the relative position of the 
#    tone within the chromatic scale.
# 
# * +letter_index+ - A 0-6 value representing the relative letter position, which 
#    helps to disambiguate theoretic values such as Eb and D#.  See +Key+.
# 
# == Key Context
# 
# +key+ is delgated to chord to access the scale's key context.
#
class ScaleTone < Tone
	belongs_to :scale
	
	acts_as_list :scope => :scale
	
	delegate :key, :to => :scale
	
end
