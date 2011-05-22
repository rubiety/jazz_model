module JazzModel
  # Abstract base class for the concept of a tone. 
  # Eventually will be expanded with common functionality for 
  # all tone objects.  
  # 
  class Tone < JazzModel::Base
    self.abstract_class = true
  
    # Defines constants representing intervals
    module Interval
      ROOT = 0
      MINOR_2ND = 1
      MAJOR_2ND = 2
      AUGMENTED_2ND = 3
      MINOR_3RD = 3
      MAJOR_3RD = 4
      PERFECT_4TH = 5
      AUGMENTED_4TH = 6
      DIMINISHED_5TH = 6
      TRITONE = 6
      PERFECT_5TH = 7
      AUGMENTED_5TH = 8
      MINOR_6TH = 8
      MAJOR_6TH = 9
      DIMINISHED_7TH = 9
      MINOR_7TH = 10
      DOMINANT_7TH = 10
      MAJOR_7TH = 11
      OCTAVE = 12
    end
  
    # Defines constants representing letter intervals
    module LetterInterval
      FIRST = 0
      SECOND = 1
      THIRD = 2
      FOURTH = 3
      FIFTH = 4
      SIXTH = 5
      SEVENTH = 6
    end
  
    module Offsets
      LOWERED = -1
      RAISED = 1
      DOUBLE_LOWERED = -2
      DOUBLE_RAISED = 2
    end
  
  end
end