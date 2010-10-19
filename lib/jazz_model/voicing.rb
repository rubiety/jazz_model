module JazzModel
  # Represents a specific piano voicing.
  # Work in progress!
  # 
  class Voicing < SuperModel::Base
  	belongs_to :chord
  	has_many :voicing_tones
	
  	delegate :key, :to => :chord
	
  end
end