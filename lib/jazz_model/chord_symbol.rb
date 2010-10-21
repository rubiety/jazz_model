module JazzModel
  # A standard chord symbol (if there is such a thing...).
  # Several chord symbols can be associated with a given chord,
  # and each chord can be designated +case_sensitive+ or not, to handle 
  # cases such as M representing Major and m representing minor. 
  # Act as a list to facilitate preference ordering.  May abandong this 
  # in the future to prefer a simple +primary+ designation.
  # 
  # == Associations
  # 
  # * +chord+ - Chord associated with the chord symbol.
  # 
  class ChordSymbol < ActiveRecord::Base
    belongs_to :chord
  
    class << self
      # Finds a chord symbol
      def resolve(symbol)
        self.all.detect do |cs|
          cs.case_sensitive? ? (cs.name == symbol) : (cs.name.downcase == symbol.downcase)
        end
      end
      alias_method :[], :resolve
    end
  
  end
end