# This module is mixed in wherever a collection of tones is being returned 
# and handles some of the fundamental logic involved in key and mode calculations 
# and note values.
# 
module ToneSequence
	# Takes manually specified key context for this collection or 
	# delegates to th association owner.
	def key
		@key || (proxy_owner.key if proxy_owner.respond_to?(:key))
	end
	
	# Manually specifies the key context for this tone sequence only.
	def in_key_of(in_key = nil)
		@key = in_key.instance_of?(String) ? Key[in_key] : in_key
		self
	end
	
	# Shifts indexes to simulat a key change
	def in_key_context!
		self.each do |tone| 
			tone.tone = (tone.tone + key.index) % 12
			tone.letter_index = (tone.letter_index + key.letter_index) % 7
		end
		true
	end
	
	# Takes manually specified mode context for this collection or 
	# delegates to the association owner.
	def mode
		@mode || (proxy_owner.mode if proxy_owner.respond_to?(:mode))
	end
	
	# Manually specifies the mode context for this tone sequence only.
	def in_mode(mode)
		@mode = mode
		self
	end
	
	# Shifts mode positions to place tone sequence in mode context
	def in_mode_context!
		self.each {|tone| tone.position = (tone.position - mode) % self.count + 1}
		true
	end
	
	# TODO: Have to use this until we figure out how to override find/default collection result
	def all
		in_key_context! if key
		in_mode_context! if mode
		self.sort_by(&:position)
	end
	
	# Does the magic in determining the actual note from the tones 
	# with tone and letter indexes. 
	def notes
		all.map do |tone|
			Key.from_index(tone.tone, tone.letter_index).name
		end.extend(NoteSequence)
	end
	
end
