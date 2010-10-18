module JazzModel
  module Definitions
    class Keys < Base
      def define
        ##### Initialize Keys #####
    		Key.create!(:name => 'C', :long_name => 'C', :index => 0, :letter_index => 0, :cycle_index => 0)
    		Key.create!(:name => 'B#', :long_name => 'B Sharp', :index => 0, :letter_index => 6, :cycle_index => 0, :primary => false)
    		Key.create!(:name => 'Dbb', :long_name => 'D Double-Flat', :index => 0, :letter_index => 1, :cycle_index => 0, :primary => false)

    		Key.create!(:name => 'F', :long_name => 'F', :index => 5, :letter_index => 3, :cycle_index => 1)
    		Key.create!(:name => 'E#', :long_name => 'E Sharp', :index => 5, :letter_index => 2, :cycle_index => 1, :primary => false)
    		Key.create!(:name => 'Gbb', :long_name => 'G Double-Flat', :index => 5, :letter_index => 4, :cycle_index => 1, :primary => false)

    		Key.create!(:name => 'Bb', :long_name => 'B Flat', :index => 10, :letter_index => 6, :cycle_index => 2)
    		Key.create!(:name => 'A#', :long_name => 'A Sharp', :index => 10, :letter_index => 5, :cycle_index => 2, :primary => false)
    		Key.create!(:name => 'Cbb', :long_name => 'C Double-Flat', :index => 10, :letter_index => 0, :cycle_index => 2, :primary => false)

    		Key.create!(:name => 'Eb', :long_name => 'E Flat', :index => 3, :letter_index => 2, :cycle_index => 3)
    		Key.create!(:name => 'D#', :long_name => 'D Sharp', :index => 3, :letter_index => 1, :cycle_index => 3, :primary => false)
    		Key.create!(:name => 'Fbb', :long_name => 'F Double Flat', :index => 3, :letter_index => 3, :cycle_index => 3, :primary => false)

    		Key.create!(:name => 'Ab', :long_name => 'A Flat', :index => 8, :letter_index => 5, :cycle_index => 4)
    		Key.create!(:name => 'G#', :long_name => 'G Sharp', :index => 8, :letter_index => 4, :cycle_index => 4, :primary => false)

    		Key.create!(:name => 'Db', :long_name => 'D Flat', :index => 1, :letter_index => 1, :cycle_index => 5)
    		Key.create!(:name => 'C#', :long_name => 'C Sharp', :index => 1, :letter_index => 0, :cycle_index => 5, :primary => false)
    		Key.create!(:name => 'B##', :long_name => 'B Double-Sharp', :index => 1, :letter_index => 6, :cycle_index => 5, :primary => false)

    		Key.create!(:name => 'Gb', :long_name => 'G Flat', :index => 6, :letter_index => 4, :cycle_index => 6)
    		Key.create!(:name => 'F#', :long_name => 'F Sharp', :index => 6, :letter_index => 3, :cycle_index => 6, :primary => false)
    		Key.create!(:name => 'E##', :long_name => 'E Double-Sharp', :index => 6, :letter_index => 2, :cycle_index => 6, :primary => false)		

    		Key.create!(:name => 'B', :long_name => 'B', :index => 11, :letter_index => 6, :cycle_index => 7)
    		Key.create!(:name => 'Cb', :long_name => 'C Flat', :index => 11, :letter_index => 0, :cycle_index => 7, :primary => false)
    		Key.create!(:name => 'A##', :long_name => 'A Double-Sharp', :index => 11, :letter_index => 5, :cycle_index => 7, :primary => false)

    		Key.create!(:name => 'E', :long_name => 'E', :index => 4, :letter_index => 2, :cycle_index => 8)
    		Key.create!(:name => 'Fb', :long_name => 'F Flat', :index => 4, :letter_index => 3, :cycle_index => 8, :primary => false)
    		Key.create!(:name => 'D##', :long_name => 'D Double-Sharp', :index => 4, :letter_index => 1, :cycle_index => 8, :primary => false)

    		Key.create!(:name => 'A', :long_name => 'A', :index => 9, :letter_index => 5, :cycle_index => 9)
    		Key.create!(:name => 'Bbb', :long_name => 'B Double-Flat', :index => 9, :letter_index => 6, :cycle_index => 9, :primary => false)
    		Key.create!(:name => 'G##', :long_name => 'G Double-Sharp', :index => 9, :letter_index => 4, :cycle_index => 9, :primary => false)		

    		Key.create!(:name => 'D', :long_name => 'D', :index => 2, :letter_index => 1, :cycle_index => 10)
    		Key.create!(:name => 'C##', :long_name => 'C Double-Sharp', :index => 2, :letter_index => 0, :cycle_index => 10, :primary => false)
    		Key.create!(:name => 'Ebb', :long_name => 'E Double-Flat', :index => 2, :letter_index => 2, :cycle_index => 10, :primary => false)

    		Key.create!(:name => 'G', :long_name => 'G', :index => 7, :letter_index => 4, :cycle_index => 11)
    		Key.create!(:name => 'F##', :long_name => 'F Double-Sharp', :index => 7, :letter_index => 3, :cycle_index => 11, :primary => false)
    		Key.create!(:name => 'Abb', :long_name => 'A Double-Flat', :index => 7, :letter_index => 5, :cycle_index => 11, :primary => false)
    		
    		super
      end
    end
  end
end