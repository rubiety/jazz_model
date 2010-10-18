module JazzModel
  # Key context is a module intended to be mixed in to classes requiring 
  # the notion of "key context".  Concepts such as chords and scales exist 
  # as mathematical relationships absent key, but can be put into key context.
  # Adds a key instance variable to the including class and two new methods:
  # 
  # * +in_key_of+(new_key) - Sets the key context to the specified new_key.
  # * +without_key+ - Removes key context.
  # 
  module KeyContext
  	def self.included(klass)
  		klass.class_eval do
  			attr_accessor :key
			
  			def in_key_of(name)
  				self.key = Key.find_by_name(name)
  				self
  			end
  			alias_method :in, :in_key_of
			
  			def without_key
  				self.key = nil
  				self
  			end
  		end
  	end
  end
end