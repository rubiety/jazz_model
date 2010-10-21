module JazzModel
  # A relationship of one chord to one scale, with some other optional 
  # information such as +strength+, representing the strength of the 
  # relationships.
  # 
  # == Associations
  # 
  # * +chord+ - Associated chord.
  # * +mode+ - Associated scale mode.
  # * +scale+ - Associated scale through mode. 
  # 
  # == Key Context
  #
  # Delegates +key+ to the associated chord to access key context through this relationship.
  # 
  class ChordScale < JazzModel::Base
    belongs_to :chord
    belongs_to :mode
  
    delegate :scale, :to => :mode
    delegate :key, :to => :chord
  
    def self.specify(mode, strength = 1)
      chord_scale = self.new
      chord_scale.mode = mode
      chord_scale.strength = strength
      chord_scale
    end
  end
end