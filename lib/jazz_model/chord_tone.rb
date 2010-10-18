module JazzModel
  # Represents one non-octval tone in a chord.  Chord tones are not ordered 
  # and arrays of chord tones should be compared using +to_set+. 
  # 
  # == Attributes
  # 
  # * +tone+ - A tone index from 0-11 representing the relative position of the 
  #   tone within the chromatic scale.
  # 
  # * +letter_index+ - A 0-6 value representing the relative letter position, which 
  #   helps to disambiguate theoretic values such as Eb and D#.  See +Key+.
  # 
  # * +strength+ - A strength metric representing the tonal strength of the tone 
  #   within the context of the chord.  Lower numbers are stronger.  Zero always 
  #   represents the root of the chord and any guide tones should be defined as one.
  # 
  # * +omitable+ - Specifies whether the tone can commonly be ommitted in jazz voicings 
  #   for this chord.  For example, the root and the fifth are often not necessary.
  # 
  # == Key Context
  # 
  #  +key+ is delgated to chord to access the chord's key context.
  # 
  class ChordTone < Tone
    belongs_to :chord
  
    acts_as_list :scope => :chord
  
    delegate :key, :to => :chord
  
  end
end