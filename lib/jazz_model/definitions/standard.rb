module JazzModel
  module Definitions
    class Default < Base
      use(Keys)
      
      def define
        def ChordScale.specify(mode, strength = 1)
          chord_scale = self.new
          chord_scale.mode = mode
          chord_scale.strength = strength
          chord_scale
        end
        
        with Scale.create!(:name => 'Major')  do |s|
          s.tones.create([
            {:tone => 0, :letter_index => FIRST},
            {:tone => 2, :letter_index => SECOND},
            {:tone => 4, :letter_index => THIRD},
            {:tone => 5, :letter_index => FOURTH},
            {:tone => 7, :letter_index => FIFTH},
            {:tone => 9, :letter_index => SIXTH},
            {:tone => 11, :letter_index => SEVENTH}
          ])

          s.modes.create!(:mode => 1, :name => 'Ionian')
          s.modes.create!(:mode => 2, :name => 'Dorian')
          s.modes.create!(:mode => 3, :name => 'Phrygian')
          s.modes.create!(:mode => 4, :name => 'Lydian')
          s.modes.create!(:mode => 5, :name => 'Mixolydian')
          s.modes.create!(:name => 6, :name => 'Aeolian')
          s.modes.create!(:name => 7, :name => 'Locrian')
        end

        with Scale.create!(:name => 'Melodic Minor') do |s|
          s.tones.create([
            {:tone => 0, :letter_index => FIRST},
            {:tone => 2, :letter_index => SECOND},
            {:tone => 3, :letter_index => THIRD},
            {:tone => 5, :letter_index => FOURTH},
            {:tone => 7, :letter_index => FIFTH},
            {:tone => 9, :letter_index => SIXTH},
            {:tone => 11, :letter_index => SEVENTH}
          ])

          s.modes.create!(:mode => 1, :name => 'Melodic Minor')
          s.modes.create!(:mode => 2, :name => 'Phrygian #6', :synonyms => 'Dorian b2')
          s.modes.create!(:mode => 3, :name => 'Lydian Augmented')
          s.modes.create!(:mode => 4, :name => 'Lydian Dominant', :synonyms => 'Mixolydian #4')
          s.modes.create!(:mode => 5, :name => 'Mixolydian b6')
          s.modes.create!(:name => 6, :name => 'Locrian #2', :synonyms => 'Aeolian b5')
          s.modes.create!(:name => 7, :name => 'Super Locrian', :synonyms => 'Diminished Whole Tone')
        end

        with Scale.create!(:name => 'Whole Tone', :symmetry_index => 2) do |s|
          s.tones.create([
            {:tone => 0, :letter_index => FIRST},
            {:tone => 2, :letter_index => SECOND},
            {:tone => 4, :letter_index => THIRD},
            {:tone => 6, :letter_index => FOURTH},
            {:tone => 8, :letter_index => FIFTH},
            {:tone => 10, :letter_index => SEVENTH}
          ])

          s.modes.create!(:mode => 1, :name => 'Whole Tone')
        end

        with Scale.create!(:name => 'Pentatonic') do |s|
          s.tones.create([
            {:tone => 0, :letter_index => FIRST},
            {:tone => 2, :letter_index => SECOND},
            {:tone => 4, :letter_index => THIRD},
            {:tone => 7, :letter_index => FIFTH},
            {:tone => 9, :letter_index => SIXTH}
          ])

          s.modes.create!(:mode => 1, :name => 'Pentatonic')
        end

        with Scale.create!(:name => 'Blues') do |s|
          s.tones.create([
            {:tone => 0, :letter_index => FIRST},
            {:tone => 2, :letter_index => SECOND},
            {:tone => 3, :letter_index => THIRD},
            {:tone => 4, :letter_index => THIRD},
            {:tone => 7, :letter_index => FIFTH}, 
            {:tone => 9, :letter_index => SIXTH}
          ])

          s.modes.create!(:mode => 1, :name => 'Major Blues')
          s.modes.create!(:mode => 5, :name => 'Minor Blues')
        end

        with Scale.create!(:name => 'Diminished', :symmetry_index => 3) do |s|
          s.tones.create([
            {:tone => 0, :letter_index => FIRST},
            {:tone => 1, :letter_index => SECOND},
            {:tone => 3, :letter_index => THIRD},
            {:tone => 4, :letter_index => THIRD},
            {:tone => 6, :letter_index => FOURTH},
            {:tone => 7, :letter_index => FIFTH},
            {:tone => 9, :letter_index => SIXTH},
            {:tone => 10, :letter_index => SEVENTH}
          ])

          s.modes.create!(:mode => 1, :name => 'Half-Whole')
          s.modes.create!(:mode => 2, :name => 'Whole-Half')
        end

        with Scale.create!(:name => 'Harmonic Minor') do |s|
          s.tones.create([
            {:tone => 0, :letter_index => FIRST},
            {:tone => 2, :letter_index => SECOND},
            {:tone => 3, :letter_index => THIRD},
            {:tone => 5, :letter_index => FOURTH},
            {:tone => 7, :letter_index => FIFTH},
            {:tone => 8, :letter_index => SIXTH},
            {:tone => 11, :letter_index => SEVENTH}
          ])
        end

        with Scale.create!(:name => 'Bebop') do |s|
          s.tones.create([
            {:tone => 0, :letter_index => FIRST},
            {:tone => 2, :letter_index => SECOND},
            {:tone => 4, :letter_index => THIRD},
            {:tone => 5, :letter_index => FOURTH},
            {:tone => 7, :letter_index => FIFTH},
            {:tone => 9, :letter_index => SIXTH},
            {:tone => 10, :letter_index => SEVENTH},
            {:tone => 11, :letter_index => SEVENTH}
          ])

          s.modes.create!(:mode => 1, :name => 'Dominant Bebop')
          s.modes.create!(:mode => 2, :name => 'Major Bebop')
        end


        ##### Initialize Chords #####

        with ChordQuality.create!(:name => 'Major', :code => 'MAJ') do |q|
          with q.chords.create!(:name => 'Major Triad') do |c|
            c.symbols.create!(:name => 'maj', :primary => true)
            c.symbols.create!(:name => 'M', :case_sensitive => true)
            c.symbols.create!(:name => 'major')

            c.tones.create([
              {:tone => ROOT, :letter_index => FIRST, :strength => 0},
              {:tone => MAJOR_3RD, :letter_index => THIRD, :strength => 2},
              {:tone => PERFECT_5TH, :letter_index => FIFTH, :strength => 1}
            ])

            c.chord_scales << ChordScale.specify(Scale['Major'][1])
          end

          with q.chords.create!(:name => 'Major 7') do |c|
            c.symbols.create!(:name => 'maj7', :primary => true)
            c.symbols.create!(:name => 'M7', :case_sensitive => true)
            c.symbols.create!(:name => 'major7')

            c.tones.create([
              {:tone => ROOT, :letter_index => FIRST, :strength => 0, :omitable => true},
              {:tone => MAJOR_3RD, :letter_index => THIRD, :strength => 1},
              {:tone => PERFECT_5TH, :letter_index => FIFTH, :strength => 2, :omitable => true},
              {:tone => MAJOR_7TH, :letter_index => SEVENTH, :strength => 2}
            ])

            with c.children.create!(:name => 'Major 7 #11') do |cc|
              cc.symbols.create!(:name => 'maj7#11', :primary => true)
              cc.symbols.create!(:name => 'M7#11')
              cc.symbols.create!(:name => 'major7#11')
              cc.symbols.create!(:name => 'lyd')
              cc.symbols.create!(:name => 'lydian')

              cc.tones.create([
                {:tone => ROOT, :letter_index => FIRST, :strength => 0, :omitable => true},
                {:tone => MAJOR_3RD, :letter_index => THIRD, :strength => 1},
                {:tone => PERFECT_5TH, :letter_index => FIFTH, :strength => 2, :omitable => true},
                {:tone => MAJOR_7TH, :letter_index => SEVENTH, :strength => 2},
                {:tone => AUGMENTED_4TH, :letter_index => FOURTH, :strength => 3}
              ])

              cc.chord_scales << ChordScale.specify(Scale['Major'][4])
            end

            with c.children.create!(:name => 'Lydian Augmented') do |cc|
              cc.symbols.create!(:name => 'maj7#4#5', :primary => true)
              cc.symbols.create!(:name => 'lydaug')
              cc.symbols.create!(:name => 'maj7#11#5')

              cc.tones.create([
                {:tone => ROOT, :letter_index => FIRST, :strength => 0, :omitable => true},
                {:tone => MAJOR_3RD, :letter_index => THIRD, :strength => 1},
                {:tone => AUGMENTED_5TH, :letter_index => FIFTH, :strength => 2, :omitable => true},
                {:tone => MAJOR_7TH, :letter_index => SEVENTH, :strength => 2},
                {:tone => AUGMENTED_4TH, :letter_index => FOURTH, :strength => 3}
              ])

              cc.chord_scales << ChordScale.specify(Scale['Melodic Minor'][3])
            end

            c.chord_scales << ChordScale.specify(Scale['Major'][1])
          end

          with q.chords.create!(:name => 'Major 6') do |c|
            c.symbols.create!(:name => '6', :primary => true)
            c.symbols.create!(:name => 'maj6')
            c.symbols.create!(:name => 'M6', :case_sensitive => true)
            c.symbols.create!(:name => 'major6')

            c.tones.create([
              {:tone => ROOT, :letter_index => FIRST, :strength => 0},
              {:tone => MAJOR_3RD, :letter_index => THIRD, :strength => 1},
              {:tone => PERFECT_5TH, :letter_index => FIFTH, :strength => 2},
              {:tone => MAJOR_6TH, :letter_index => SIXTH, :strength => 3}
            ])

            c.chord_scales << ChordScale.specify(Scale['Pentatonic'][1])
            c.chord_scales << ChordScale.specify(Scale['Major'][1], 2)
          end
        end


        with ChordQuality.create!(:name => 'Minor', :code => 'MIN') do |q|
          with q.chords.create!(:name => 'Minor Triad') do |c|
            c.symbols.create!(:name => 'min', :primary => true)
            c.symbols.create!(:name => 'm', :case_sensitive => true)
            c.symbols.create!(:name => 'minor')

            c.tones.create([
              {:tone => ROOT, :letter_index => FIRST, :strength => 0},
              {:tone => MINOR_3RD, :letter_index => THIRD, :strength => 1},
              {:tone => PERFECT_5TH, :letter_index => FIFTH, :strength => 2}
            ])

            c.chord_scales << ChordScale.specify(Scale['Major'][2])
            c.chord_scales << ChordScale.specify(Scale['Major'][6], 2)
            c.chord_scales << ChordScale.specify(Scale['Major'][3], 3)
          end

          with q.chords.create!(:name => 'Minor 7') do |c|
            c.symbols.create!(:name => 'min7', :primary => true)
            c.symbols.create!(:name => 'm7', :case_sensitive => true)
            c.symbols.create!(:name => 'minor7')

            c.tones.create([
              {:tone => ROOT, :letter_index => FIRST, :strength => 0, :omitable => true},
              {:tone => MINOR_3RD, :letter_index => THIRD, :strength => 1},
              {:tone => PERFECT_5TH, :letter_index => FIFTH, :strength => 2, :omitable => true},
              {:tone => MINOR_7TH, :letter_index => SEVENTH, :strength => 1}
            ])

            c.chord_scales << ChordScale.specify(Scale['Major'][2])
            c.chord_scales << ChordScale.specify(Scale['Major'][6], 2)
          end

          with q.chords.create!(:name => 'Minor 6') do |c|
            c.symbols.create!(:name => 'min6', :primary => true)
            c.symbols.create!(:name => 'm6', :case_sensitive => true)
            c.symbols.create!(:name => 'minor6')

            c.tones.create([
              {:tone => ROOT, :letter_index => FIRST, :strength => 0, :omitable => true},
              {:tone => MINOR_3RD, :letter_index => THIRD, :strength => 1},
              {:tone => PERFECT_5TH, :letter_index => FIFTH, :strength => 2},
              {:tone => MAJOR_6TH, :letter_index => SIXTH, :strength => 1}
            ])

            c.chord_scales << ChordScale.specify(Scale['Major'][1])
          end

          with q.chords.create!(:name => 'Phrygian') do |c|
            c.symbols.create!(:name => 'phryg', :primary => true)
            c.symbols.create!(:name => 'minb2')
            c.symbols.create!(:name => 'mb2')
            c.symbols.create!(:name => 'minorb2')
            c.symbols.create!(:name => 'phrygian')
            c.symbols.create!(:name => 'susb9')

            c.tones.create([
              {:tone => ROOT, :letter_index => FIRST, :strength => 0, :omitable => true},
              {:tone => MINOR_3RD, :letter_index => THIRD, :strength => 1},
              {:tone => PERFECT_5TH, :letter_index => FIFTH, :strength => 2},
              {:tone => MINOR_2ND, :letter_index => SECOND, :strength => 1},
              {:tone => MINOR_6TH, :letter_index => SIXTH, :strength => 3}
            ])

            c.chord_scales << ChordScale.specify(Scale['Major'][3])
          end

          with q.chords.create!(:name => 'Minor b6') do |c|
            c.symbols.create!(:name => 'minb6', :primary => true)
            c.symbols.create!(:name => 'mb6')
            c.symbols.create!(:name => 'minorb6')
            c.symbols.create!(:name => 'aeolian')

            c.tones.create([
              {:tone => ROOT, :letter_index => FIRST, :strength => 0, :omitable => true},
              {:tone => MINOR_3RD, :letter_index => THIRD, :strength => 1},
              {:tone => PERFECT_5TH, :letter_index => FIFTH, :strength => 2},
              {:tone => MINOR_6TH, :letter_index => SIXTH, :strength => 3}
            ])

            c.chord_scales << ChordScale.specify(Scale['Major'][6])
          end

          with q.chords.create!(:name => 'Major-Minor') do |c|
            c.symbols.create!(:name => 'min#7', :primary => true)
            c.symbols.create!(:name => 'majmin')
            c.symbols.create!(:name => 'm#7', :case_sensitive => true)
            c.symbols.create!(:name => 'minor#7')
            c.symbols.create!(:name => 'major-minor')

            c.tones.create([
              {:tone => ROOT, :letter_index => FIRST, :strength => 0, :omitable => true},
              {:tone => MINOR_3RD, :letter_index => THIRD, :strength => 1},
              {:tone => PERFECT_5TH, :letter_index => FIFTH, :strength => 2},
              {:tone => MAJOR_7TH, :letter_index => SEVENTH, :strength => 1}
            ])

            c.chord_scales << ChordScale.specify(Scale['Melodic Minor'][1])
          end
        end


        with ChordQuality.create!(:name => 'Dominant', :code => 'DOM') do |q|
          with q.chords.create!(:name => 'Dominant 7') do |c|
            c.symbols.create!(:name => '7', :primary => true)
            c.symbols.create!(:name => 'dom')

            c.tones.create([
              {:tone => ROOT, :letter_index => FIRST, :strength => 0, :omitable => true},
              {:tone => MAJOR_3RD, :letter_index => THIRD, :strength => 1},
              {:tone => PERFECT_5TH, :letter_index => FIFTH, :strength => 3, :omitable => true},
              {:tone => DOMINANT_7TH, :letter_index => SEVENTH, :strength => 2}
            ])

            c.chord_scales << ChordScale.specify(Scale['Major']['Mixolydian'])

            with c.children.create!(:name => 'Dominant 9') do |cc|
              cc.symbols.create!(:name => '9', :primary => true)
              cc.symbols.create!(:name => 'dom9')

              cc.tones.create([
                {:tone => ROOT, :letter_index => FIRST, :strength => 0, :omitable => true},
                {:tone => MAJOR_3RD, :letter_index => THIRD, :strength => 1},
                {:tone => PERFECT_5TH, :letter_index => FIFTH, :strength => 3, :omitable => true},
                {:tone => DOMINANT_7TH, :letter_index => SEVENTH, :strength => 2},
                {:tone => MAJOR_2ND, :letter_index => SECOND, :strength => 4}
              ])

              cc.chord_scales << ChordScale.specify(Scale['Major']['Mixolydian'])
            end

            with c.children.create!(:name => 'Dominant 6/9') do |cc|
              cc.symbols.create!(:name => '6/9', :primary => true)
              cc.symbols.create!(:name => '69')

              cc.tones.create([
                {:tone => ROOT, :letter_index => FIRST, :strength => 0, :omitable => true},
                {:tone => MAJOR_3RD, :letter_index => THIRD, :strength => 1},
                {:tone => PERFECT_5TH, :letter_index => FIFTH, :strength => 3, :omitable => true},
                {:tone => DOMINANT_7TH, :letter_index => SEVENTH, :strength => 2},
                {:tone => MAJOR_2ND, :letter_index => SECOND, :strength => 4},
                {:tone => MAJOR_6TH, :letter_index => SIXTH, :strength => 4}
              ])

              cc.chord_scales << ChordScale.specify(Scale['Major']['Mixolydian'])
              cc.chord_scales << ChordScale.specify(Scale['Major']['Ionian'])
            end

            with c.children.create!(:name => 'Dominant b9') do |cc|
              cc.symbols.create!(:name => '7b9', :primary => true)

              cc.tones.create([
                {:tone => ROOT, :letter_index => FIRST, :strength => 0, :omitable => true},
                {:tone => MAJOR_3RD, :letter_index => THIRD, :strength => 1},
                {:tone => PERFECT_5TH, :letter_index => FIFTH, :strength => 3, :omitable => true},
                {:tone => DOMINANT_7TH, :letter_index => SEVENTH, :strength => 2},
                {:tone => MINOR_2ND, :letter_index => SECOND, :strength => 4}
              ])

              cc.chord_scales << ChordScale.specify(Scale['Diminished'][1])
              cc.chord_scales << ChordScale.specify(Scale['Major']['Mixolydian'], 2)
            end

            with c.children.create!(:name => 'Dominant #9') do |cc|
              cc.symbols.create!(:name => '7#9', :primary => true)

              cc.tones.create([
                {:tone => ROOT, :letter_index => FIRST, :strength => 0, :omitable => true},
                {:tone => MAJOR_3RD, :letter_index => THIRD, :strength => 1},
                {:tone => PERFECT_5TH, :letter_index => FIFTH, :strength => 3, :omitable => true},
                {:tone => DOMINANT_7TH, :letter_index => SEVENTH, :strength => 2},
                {:tone => AUGMENTED_2ND, :letter_index => SECOND, :strength => 4}
              ])

              cc.chord_scales << ChordScale.specify(Scale['Melodic Minor'][7])
              cc.chord_scales << ChordScale.specify(Scale['Diminished'][1], 2)
            end

            with c.children.create!(:name => 'Dominant #11') do |cc|
              cc.symbols.create!(:name => '7#11', :primary => true)
              cc.symbols.create!(:name => 'lyd7')
              cc.symbols.create!(:name => 'lydiandom')

              cc.tones.create([
                {:tone => ROOT, :letter_index => FIRST, :strength => 0, :omitable => true},
                {:tone => MAJOR_3RD, :letter_index => THIRD, :strength => 1},
                {:tone => PERFECT_5TH, :letter_index => FIFTH, :strength => 3, :omitable => true},
                {:tone => DOMINANT_7TH, :letter_index => SEVENTH, :strength => 2},
                {:tone => AUGMENTED_4TH, :letter_index => FOURTH, :strength => 4}
              ])

              cc.chord_scales << ChordScale.specify(Scale['Melodic Minor'][4])
            end

            with c.children.create!(:name => 'Mixoylidian b6') do |cc|
              cc.symbols.create!(:name => '7b6', :primary => true)

              cc.tones.create([
                {:tone => ROOT, :letter_index => FIRST, :strength => 0, :omitable => true},
                {:tone => MAJOR_3RD, :letter_index => THIRD, :strength => 1},
                {:tone => PERFECT_5TH, :letter_index => FIFTH, :strength => 3},
                {:tone => DOMINANT_7TH, :letter_index => SEVENTH, :strength => 2},
                {:tone => MINOR_6TH, :letter_index => SIXTH, :strength => 4}
              ])

              cc.chord_scales << ChordScale.specify(Scale['Melodic Minor'][5])
            end

            with c.children.create!(:name => 'Altered') do |cc|
              cc.symbols.create!(:name => 'alt', :primary => true)
              cc.symbols.create!(:name => 'altered')
              cc.symbols.create!(:name => '7#9#5')
              cc.symbols.create!(:name => '7#5#9')
              cc.symbols.create!(:name => '7b9#9')
              cc.symbols.create!(:name => '7#9b9')
              cc.symbols.create!(:name => '7#5')

              cc.tones.create([
                {:tone => ROOT, :letter_index => FIRST, :strength => 0, :omitable => true},
                {:tone => MAJOR_3RD, :letter_index => THIRD, :strength => 1},
                {:tone => DOMINANT_7TH, :letter_index => SEVENTH, :strength => 2},
                {:tone => MINOR_2ND, :letter_index => SECOND, :strength => 4},
                {:tone => AUGMENTED_2ND, :letter_index => SECOND, :strength => 4},
                {:tone => AUGMENTED_5TH, :letter_index => FIFTH, :strength => 4}
              ])

              cc.chord_scales << ChordScale.specify(Scale['Melodic Minor'][7])
            end

            with c.children.create!(:name => 'Dominant b5') do |cc|
              cc.symbols.create!(:name => '7b5', :primary => true)

              cc.tones.create([
                {:tone => ROOT, :letter_index => FIRST, :strength => 0, :omitable => true},
                {:tone => MAJOR_3RD, :letter_index => THIRD, :strength => 1},
                {:tone => DIMINISHED_5TH, :letter_index => FIFTH, :strength => 3},
                {:tone => DOMINANT_7TH, :letter_index => SEVENTH, :strength => 2}
              ])

              cc.chord_scales << ChordScale.specify(Scale['Melodic Minor'][4])
            end

          end
        end


        with ChordQuality.create!(:name => 'Diminished', :code => 'DIM') do |q|
          with q.chords.create!(:name => 'Diminished Triad') do |c|
            c.symbols.create!(:name => 'dim', :primary => true)
            c.symbols.create!(:name => 'b5')

            c.tones.create([
              {:tone => ROOT, :letter_index => FIRST, :strength => 0},
              {:tone => MINOR_3RD, :letter_index => THIRD, :strength => 1},
              {:tone => DIMINISHED_5TH, :letter_index => FIFTH, :strength => 1}
            ])

            c.chord_scales << ChordScale.specify(Scale['Diminished'][1])
            c.chord_scales << ChordScale.specify(Scale['Diminished'][2])
          end

          with q.chords.create!(:name => 'Half Diminished') do |c|
            c.symbols.create!(:name => 'dim7', :primary => true)
            c.symbols.create!(:name => '7b5')

            c.tones.create([
              {:tone => ROOT, :letter_index => FIRST, :strength => 0},
              {:tone => MINOR_3RD, :letter_index => THIRD, :strength => 2},
              {:tone => DIMINISHED_5TH, :letter_index => FIFTH, :strength => 1},
              {:tone => MINOR_7TH, :letter_index => SEVENTH, :strength => 1}
            ])

            c.chord_scales << ChordScale.specify(Scale['Major'][7])
            c.chord_scales << ChordScale.specify(Scale['Melodic Minor'][6])
          end

          with q.chords.create!(:name => 'Full Diminished') do |c|
            c.symbols.create!(:name => 'fulldim', :primary => true)
            c.symbols.create!(:name => 'b5bb7')

            c.tones.create([
              {:tone => ROOT, :letter_index => FIRST, :strength => 0},
              {:tone => MINOR_3RD, :letter_index => THIRD, :strength => 2},
              {:tone => DIMINISHED_5TH, :letter_index => FIFTH, :strength => 1},
              {:tone => DIMINISHED_7TH, :letter_index => SEVENTH, :strength => 1}
            ])

            c.chord_scales << ChordScale.specify(Scale['Diminished'][1])
            c.chord_scales << ChordScale.specify(Scale['Diminished'][2])
          end
        end
      end
    end
  end
end