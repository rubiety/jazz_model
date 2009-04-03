require 'set'

# NotesCollection represents a collection of notes.  Using this collection,
# you can determine chord and scale/mode matches in specific or all keys. 
# This class is currently under heavily development and will eventually be home to heavy logic involved 
# in associating an arbitrary collection of notes with chords, given that 
# some scales tone may be "omitable", etc.
# 
# == Creating a NotesCollection object
# 
# Creating the collection of notes should be done by indexing 
# the Notes class directly with a comma-separated string of notes.
# 
# == Current Limitations
# 
# Will only do exact 100% match of notes given and notes in chords.  No fuzzyness
# such as the ability to omit the root and other non-important tones.  Does not yet 
# find supersets or subsets.
# 
# == Examples
# 
# === Finding All Associated Chords
# 
#   NotesCollection['C, E, G, A'].chords.symbols
#   # => "Amin7, Cmaj6"
#  
# === Finding Associated Chords in Given Key
#
#   NotesCollection['C, E, G, A'].in_key_of('A').chords.symbols
#   # => "Amin7"
# 
class NotesCollection
	include Enumerable
	include KeyContext
	
	attr_accessor :keys
	attr_accessor :invalid_keys
	
	def initialize(value = [])
		@value_as_given = value
		@keys = []
		@invalid_keys = []
		
		value = value.split(/,| /).map(&:strip) if value.instance_of?(String)
		value.each do |key_name|
			key_object = Key[key_name]
			
			if key_object.nil?
				@invalid_keys << key_name
			else
				@keys << key_object
			end
		end
	end
	
	class << self
		alias_method :[], :new
	end
	
	delegate :each, :to => :keys
	
	# Chords associated with this collection of notes
	def chords
		if key
			chords_in_key(key)
		else
			Key.primaries.map do |in_key|
				chords_in_key(in_key)
			end.flatten
		end.extend(ChordCollection)
	end
	
	# XML Representation
	def to_xml
		'<NotesCollection name="' + @value_as_given.to_s + '"></NotesCollection>'
	end
	
	
	private
	
	def chords_in_key(in_key)
		Chord.all.select do |c|
			c.tones.map(&:tone).to_set == keys.map {|k| (k.index - (in_key ? in_key.index : 0)) % 12 }.to_set
		end.map {|c| c.key = in_key; c}
	end
	
end
