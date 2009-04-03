# In music theory a mode is essentially a slice of a scale with an offset. 
# For example second mode of the C major scale would begin and end on D 
# but otherwise have the exact same tones as the C major scale.
# 
# This class represents a mode within the context of a +Scale+.  
# 
# == Associations
# 
# * +scale+ - The related scale.
# * +chord_scales+ - +ChordScale+ relationships to this mode.
# * +chords+ - Direct access to a collection of chords through +chord_scales+.
# 
# == Tones and Mode Context
# 
# Tones are directly related to scales, not modes.  There is a +tones+ method 
# (and a +notes+ method that delegates to +tones+) here that simulates the tones for 
# the mode by setting the mode context of the scale tones, effectively returning 
# the tones shifted by X where X is the mode number.
# Therefore, you can access tones directly off of the mode because they are proxied 
# through scale with the correct offset. 
# 
# == Examples
# 
# Since modes should be accessed within the context of scales, mode-related examples are 
# actually in scale.  See +Scale+.
# 
class Mode < ActiveRecord::Base
	include KeyContext
	
	belongs_to :scale
	
	has_many :chord_scales
	has_many :chords, :through => :chord_scales, :extend => ChordCollection
	
	delegate :notes, :to => :tones
	
	def tones
		if self.key
			self.scale.tones.in_mode(self.mode).in_key_of(self.key)
		else
			self.scale.tones.in_mode(self.mode)
		end
	end
	
	# Retreives Fully-Cached Array
	def self.cache(conditions = {})
		self.find(:all, :include => :scale, :conditions => conditions) # Rails 2.0 Already Caches!
	end
	
end
