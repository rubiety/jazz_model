module JazzModel
  # A basic chord quality such as major or minor.  This may be abandoned in the future in favor of a 
  # deep heirarchy based soley around chords.
  # 
  # == Associations
  # * +chords+ - A collection of chords associated with the chord quality.
  # 
  class ChordQuality < ActiveRecord::Base
    has_many :chords

    class << self
      def resolve(name)
        self.find_by_name(name)
      end
      alias_method :[], :resolve
    end

  end
end