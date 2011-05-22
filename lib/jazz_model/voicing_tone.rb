module JazzModel
  # Represents a tone in a piano voicing.
  # Work in progress!
  # 
  class VoicingTone < Tone
    belongs_to :voicing
  
    acts_as_list :scope => :voicing
  
  end
end