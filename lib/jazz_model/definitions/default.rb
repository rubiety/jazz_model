JazzModel::Definition.define :default => [:keys] do
  JazzModel::Scale.create!(:name => 'Major').tap do |s|
    s.tones.create([
      {:tone => 0, :letter_index => JazzModel::Tone::LetterInterval::FIRST},
      {:tone => 2, :letter_index => JazzModel::Tone::LetterInterval::SECOND},
      {:tone => 4, :letter_index => JazzModel::Tone::LetterInterval::THIRD},
      {:tone => 5, :letter_index => JazzModel::Tone::LetterInterval::FOURTH},
      {:tone => 7, :letter_index => JazzModel::Tone::LetterInterval::FIFTH},
      {:tone => 9, :letter_index => JazzModel::Tone::LetterInterval::SIXTH},
      {:tone => 11, :letter_index => JazzModel::Tone::LetterInterval::SEVENTH}
    ])
    
    s.modes.create!(:mode => 1, :name => 'Ionian')
    s.modes.create!(:mode => 2, :name => 'Dorian')
    s.modes.create!(:mode => 3, :name => 'Phrygian')
    s.modes.create!(:mode => 4, :name => 'Lydian')
    s.modes.create!(:mode => 5, :name => 'Mixolydian')
    s.modes.create!(:name => 6, :name => 'Aeolian')
    s.modes.create!(:name => 7, :name => 'Locrian')
  end

  JazzModel::Scale.create!(:name => 'Melodic Minor').tap do |s|
    s.tones.create([
      {:tone => 0, :letter_index => JazzModel::Tone::LetterInterval::FIRST},
      {:tone => 2, :letter_index => JazzModel::Tone::LetterInterval::SECOND},
      {:tone => 3, :letter_index => JazzModel::Tone::LetterInterval::THIRD},
      {:tone => 5, :letter_index => JazzModel::Tone::LetterInterval::FOURTH},
      {:tone => 7, :letter_index => JazzModel::Tone::LetterInterval::FIFTH},
      {:tone => 9, :letter_index => JazzModel::Tone::LetterInterval::SIXTH},
      {:tone => 11, :letter_index => JazzModel::Tone::LetterInterval::SEVENTH}
    ])

    s.modes.create!(:mode => 1, :name => 'Melodic Minor')
    s.modes.create!(:mode => 2, :name => 'Phrygian #6', :synonyms => 'Dorian b2')
    s.modes.create!(:mode => 3, :name => 'Lydian Augmented')
    s.modes.create!(:mode => 4, :name => 'Lydian Dominant', :synonyms => 'Mixolydian #4')
    s.modes.create!(:mode => 5, :name => 'Mixolydian b6')
    s.modes.create!(:name => 6, :name => 'Locrian #2', :synonyms => 'Aeolian b5')
    s.modes.create!(:name => 7, :name => 'Super Locrian', :synonyms => 'Diminished Whole Tone')
  end

  JazzModel::Scale.create!(:name => 'Whole Tone', :symmetry_index => 2).tap do |s|
    s.tones.create([
      {:tone => 0, :letter_index => JazzModel::Tone::LetterInterval::FIRST},
      {:tone => 2, :letter_index => JazzModel::Tone::LetterInterval::SECOND},
      {:tone => 4, :letter_index => JazzModel::Tone::LetterInterval::THIRD},
      {:tone => 6, :letter_index => JazzModel::Tone::LetterInterval::FOURTH},
      {:tone => 8, :letter_index => JazzModel::Tone::LetterInterval::FIFTH},
      {:tone => 10, :letter_index => JazzModel::Tone::LetterInterval::SEVENTH}
    ])

    s.modes.create!(:mode => 1, :name => 'Whole Tone')
  end

  JazzModel::Scale.create!(:name => 'Pentatonic').tap do |s|
    s.tones.create([
      {:tone => 0, :letter_index => JazzModel::Tone::LetterInterval::FIRST},
      {:tone => 2, :letter_index => JazzModel::Tone::LetterInterval::SECOND},
      {:tone => 4, :letter_index => JazzModel::Tone::LetterInterval::THIRD},
      {:tone => 7, :letter_index => JazzModel::Tone::LetterInterval::FIFTH},
      {:tone => 9, :letter_index => JazzModel::Tone::LetterInterval::SIXTH}
    ])

    s.modes.create!(:mode => 1, :name => 'Pentatonic')
  end

  JazzModel::Scale.create!(:name => 'Blues').tap do |s|
    s.tones.create([
      {:tone => 0, :letter_index => JazzModel::Tone::LetterInterval::FIRST},
      {:tone => 2, :letter_index => JazzModel::Tone::LetterInterval::SECOND},
      {:tone => 3, :letter_index => JazzModel::Tone::LetterInterval::THIRD},
      {:tone => 4, :letter_index => JazzModel::Tone::LetterInterval::THIRD},
      {:tone => 7, :letter_index => JazzModel::Tone::LetterInterval::FIFTH}, 
      {:tone => 9, :letter_index => JazzModel::Tone::LetterInterval::SIXTH}
    ])

    s.modes.create!(:mode => 1, :name => 'Major Blues')
    s.modes.create!(:mode => 5, :name => 'Minor Blues')
  end

  JazzModel::Scale.create!(:name => 'Diminished', :symmetry_index => 3).tap do |s|
    s.tones.create([
      {:tone => 0, :letter_index => JazzModel::Tone::LetterInterval::FIRST},
      {:tone => 1, :letter_index => JazzModel::Tone::LetterInterval::SECOND},
      {:tone => 3, :letter_index => JazzModel::Tone::LetterInterval::THIRD},
      {:tone => 4, :letter_index => JazzModel::Tone::LetterInterval::THIRD},
      {:tone => 6, :letter_index => JazzModel::Tone::LetterInterval::FOURTH},
      {:tone => 7, :letter_index => JazzModel::Tone::LetterInterval::FIFTH},
      {:tone => 9, :letter_index => JazzModel::Tone::LetterInterval::SIXTH},
      {:tone => 10, :letter_index => JazzModel::Tone::LetterInterval::SEVENTH}
    ])

    s.modes.create!(:mode => 1, :name => 'Half-Whole')
    s.modes.create!(:mode => 2, :name => 'Whole-Half')
  end

  JazzModel::Scale.create!(:name => 'Harmonic Minor').tap do |s|
    s.tones.create([
      {:tone => 0, :letter_index => JazzModel::Tone::LetterInterval::FIRST},
      {:tone => 2, :letter_index => JazzModel::Tone::LetterInterval::SECOND},
      {:tone => 3, :letter_index => JazzModel::Tone::LetterInterval::THIRD},
      {:tone => 5, :letter_index => JazzModel::Tone::LetterInterval::FOURTH},
      {:tone => 7, :letter_index => JazzModel::Tone::LetterInterval::FIFTH},
      {:tone => 8, :letter_index => JazzModel::Tone::LetterInterval::SIXTH},
      {:tone => 11, :letter_index => JazzModel::Tone::LetterInterval::SEVENTH}
    ])
  end

  JazzModel::Scale.create!(:name => 'Bebop').tap do |s|
    s.tones.create([
      {:tone => 0, :letter_index => JazzModel::Tone::LetterInterval::FIRST},
      {:tone => 2, :letter_index => JazzModel::Tone::LetterInterval::SECOND},
      {:tone => 4, :letter_index => JazzModel::Tone::LetterInterval::THIRD},
      {:tone => 5, :letter_index => JazzModel::Tone::LetterInterval::FOURTH},
      {:tone => 7, :letter_index => JazzModel::Tone::LetterInterval::FIFTH},
      {:tone => 9, :letter_index => JazzModel::Tone::LetterInterval::SIXTH},
      {:tone => 10, :letter_index => JazzModel::Tone::LetterInterval::SEVENTH},
      {:tone => 11, :letter_index => JazzModel::Tone::LetterInterval::SEVENTH}
    ])

    s.modes.create!(:mode => 1, :name => 'Dominant Bebop')
    s.modes.create!(:mode => 2, :name => 'Major Bebop')
  end


  ##### Initialize Chords #####

  JazzModel::ChordQuality.create!(:name => 'Major', :code => 'MAJ').tap do |q|
    q.chords.create!(:name => 'Major Triad').tap do |c|
      c.symbols.create!(:name => 'maj', :primary => true)
      c.symbols.create!(:name => 'M', :case_sensitive => true)
      c.symbols.create!(:name => 'major')

      c.tones.create([
        {:tone => JazzModel::Tone::Interval::ROOT, :letter_index => JazzModel::Tone::LetterInterval::FIRST, :strength => 0},
        {:tone => JazzModel::Tone::Interval::MAJOR_3RD, :letter_index => JazzModel::Tone::LetterInterval::THIRD, :strength => 2},
        {:tone => JazzModel::Tone::Interval::PERFECT_5TH, :letter_index => JazzModel::Tone::LetterInterval::FIFTH, :strength => 1}
      ])

      c.chord_scales << JazzModel::ChordScale.specify(JazzModel::Scale['Major'][1])
    end

    q.chords.create!(:name => 'Major 7').tap do |c|
      c.symbols.create!(:name => 'maj7', :primary => true)
      c.symbols.create!(:name => 'M7', :case_sensitive => true)
      c.symbols.create!(:name => 'major7')

      c.tones.create([
        {:tone => JazzModel::Tone::Interval::ROOT, :letter_index => JazzModel::Tone::LetterInterval::FIRST, :strength => 0, :omitable => true},
        {:tone => JazzModel::Tone::Interval::MAJOR_3RD, :letter_index => JazzModel::Tone::LetterInterval::THIRD, :strength => 1},
        {:tone => JazzModel::Tone::Interval::PERFECT_5TH, :letter_index => JazzModel::Tone::LetterInterval::FIFTH, :strength => 2, :omitable => true},
        {:tone => JazzModel::Tone::Interval::MAJOR_7TH, :letter_index => JazzModel::Tone::LetterInterval::SEVENTH, :strength => 2}
      ])

      c.children.create!(:name => 'Major 7 #11').tap do |cc|
        cc.symbols.create!(:name => 'maj7#11', :primary => true)
        cc.symbols.create!(:name => 'M7#11')
        cc.symbols.create!(:name => 'major7#11')
        cc.symbols.create!(:name => 'lyd')
        cc.symbols.create!(:name => 'lydian')

        cc.tones.create([
          {:tone => JazzModel::Tone::Interval::ROOT, :letter_index => JazzModel::Tone::LetterInterval::FIRST, :strength => 0, :omitable => true},
          {:tone => JazzModel::Tone::Interval::MAJOR_3RD, :letter_index => JazzModel::Tone::LetterInterval::THIRD, :strength => 1},
          {:tone => JazzModel::Tone::Interval::PERFECT_5TH, :letter_index => JazzModel::Tone::LetterInterval::FIFTH, :strength => 2, :omitable => true},
          {:tone => JazzModel::Tone::Interval::MAJOR_7TH, :letter_index => JazzModel::Tone::LetterInterval::SEVENTH, :strength => 2},
          {:tone => JazzModel::Tone::Interval::AUGMENTED_4TH, :letter_index => JazzModel::Tone::LetterInterval::FOURTH, :strength => 3}
        ])

        cc.chord_scales << JazzModel::ChordScale.specify(JazzModel::Scale['Major'][4])
      end

      c.children.create!(:name => 'Lydian Augmented').tap do |cc|
        cc.symbols.create!(:name => 'maj7#4#5', :primary => true)
        cc.symbols.create!(:name => 'lydaug')
        cc.symbols.create!(:name => 'maj7#11#5')

        cc.tones.create([
          {:tone => JazzModel::Tone::Interval::ROOT, :letter_index => JazzModel::Tone::LetterInterval::FIRST, :strength => 0, :omitable => true},
          {:tone => JazzModel::Tone::Interval::MAJOR_3RD, :letter_index => JazzModel::Tone::LetterInterval::THIRD, :strength => 1},
          {:tone => JazzModel::Tone::Interval::AUGMENTED_5TH, :letter_index => JazzModel::Tone::LetterInterval::FIFTH, :strength => 2, :omitable => true},
          {:tone => JazzModel::Tone::Interval::MAJOR_7TH, :letter_index => JazzModel::Tone::LetterInterval::SEVENTH, :strength => 2},
          {:tone => JazzModel::Tone::Interval::AUGMENTED_4TH, :letter_index => JazzModel::Tone::LetterInterval::FOURTH, :strength => 3}
        ])

        cc.chord_scales << JazzModel::ChordScale.specify(JazzModel::Scale['Melodic Minor'][3])
      end

      c.chord_scales << JazzModel::ChordScale.specify(JazzModel::Scale['Major'][1])
    end

    q.chords.create!(:name => 'Major 6').tap do |c|
      c.symbols.create!(:name => '6', :primary => true)
      c.symbols.create!(:name => 'maj6')
      c.symbols.create!(:name => 'M6', :case_sensitive => true)
      c.symbols.create!(:name => 'major6')

      c.tones.create([
        {:tone => JazzModel::Tone::Interval::ROOT, :letter_index => JazzModel::Tone::LetterInterval::FIRST, :strength => 0},
        {:tone => JazzModel::Tone::Interval::MAJOR_3RD, :letter_index => JazzModel::Tone::LetterInterval::THIRD, :strength => 1},
        {:tone => JazzModel::Tone::Interval::PERFECT_5TH, :letter_index => JazzModel::Tone::LetterInterval::FIFTH, :strength => 2},
        {:tone => JazzModel::Tone::Interval::MAJOR_6TH, :letter_index => JazzModel::Tone::LetterInterval::SIXTH, :strength => 3}
      ])

      c.chord_scales << JazzModel::ChordScale.specify(JazzModel::Scale['Pentatonic'][1])
      c.chord_scales << JazzModel::ChordScale.specify(JazzModel::Scale['Major'][1], 2)
    end
  end


  JazzModel::ChordQuality.create!(:name => 'Minor', :code => 'MIN').tap do |q|
    q.chords.create!(:name => 'Minor Triad').tap do |c|
      c.symbols.create!(:name => 'min', :primary => true)
      c.symbols.create!(:name => 'm', :case_sensitive => true)
      c.symbols.create!(:name => 'minor')

      c.tones.create([
        {:tone => JazzModel::Tone::Interval::ROOT, :letter_index => JazzModel::Tone::LetterInterval::FIRST, :strength => 0},
        {:tone => JazzModel::Tone::Interval::MINOR_3RD, :letter_index => JazzModel::Tone::LetterInterval::THIRD, :strength => 1},
        {:tone => JazzModel::Tone::Interval::PERFECT_5TH, :letter_index => JazzModel::Tone::LetterInterval::FIFTH, :strength => 2}
      ])

      c.chord_scales << JazzModel::ChordScale.specify(JazzModel::Scale['Major'][2])
      c.chord_scales << JazzModel::ChordScale.specify(JazzModel::Scale['Major'][6], 2)
      c.chord_scales << JazzModel::ChordScale.specify(JazzModel::Scale['Major'][3], 3)
    end

    q.chords.create!(:name => 'Minor 7').tap do |c|
      c.symbols.create!(:name => 'min7', :primary => true)
      c.symbols.create!(:name => 'm7', :case_sensitive => true)
      c.symbols.create!(:name => 'minor7')

      c.tones.create([
        {:tone => JazzModel::Tone::Interval::ROOT, :letter_index => JazzModel::Tone::LetterInterval::FIRST, :strength => 0, :omitable => true},
        {:tone => JazzModel::Tone::Interval::MINOR_3RD, :letter_index => JazzModel::Tone::LetterInterval::THIRD, :strength => 1},
        {:tone => JazzModel::Tone::Interval::PERFECT_5TH, :letter_index => JazzModel::Tone::LetterInterval::FIFTH, :strength => 2, :omitable => true},
        {:tone => JazzModel::Tone::Interval::MINOR_7TH, :letter_index => JazzModel::Tone::LetterInterval::SEVENTH, :strength => 1}
      ])

      c.chord_scales << JazzModel::ChordScale.specify(JazzModel::Scale['Major'][2])
      c.chord_scales << JazzModel::ChordScale.specify(JazzModel::Scale['Major'][6], 2)
    end

    q.chords.create!(:name => 'Minor 6').tap do |c|
      c.symbols.create!(:name => 'min6', :primary => true)
      c.symbols.create!(:name => 'm6', :case_sensitive => true)
      c.symbols.create!(:name => 'minor6')

      c.tones.create([
        {:tone => JazzModel::Tone::Interval::ROOT, :letter_index => JazzModel::Tone::LetterInterval::FIRST, :strength => 0, :omitable => true},
        {:tone => JazzModel::Tone::Interval::MINOR_3RD, :letter_index => JazzModel::Tone::LetterInterval::THIRD, :strength => 1},
        {:tone => JazzModel::Tone::Interval::PERFECT_5TH, :letter_index => JazzModel::Tone::LetterInterval::FIFTH, :strength => 2},
        {:tone => JazzModel::Tone::Interval::MAJOR_6TH, :letter_index => JazzModel::Tone::LetterInterval::SIXTH, :strength => 1}
      ])

      c.chord_scales << JazzModel::ChordScale.specify(JazzModel::Scale['Major'][1])
    end

    q.chords.create!(:name => 'Phrygian').tap do |c|
      c.symbols.create!(:name => 'phryg', :primary => true)
      c.symbols.create!(:name => 'minb2')
      c.symbols.create!(:name => 'mb2')
      c.symbols.create!(:name => 'minorb2')
      c.symbols.create!(:name => 'phrygian')
      c.symbols.create!(:name => 'susb9')

      c.tones.create([
        {:tone => JazzModel::Tone::Interval::ROOT, :letter_index => JazzModel::Tone::LetterInterval::FIRST, :strength => 0, :omitable => true},
        {:tone => JazzModel::Tone::Interval::MINOR_3RD, :letter_index => JazzModel::Tone::LetterInterval::THIRD, :strength => 1},
        {:tone => JazzModel::Tone::Interval::PERFECT_5TH, :letter_index => JazzModel::Tone::LetterInterval::FIFTH, :strength => 2},
        {:tone => JazzModel::Tone::Interval::MINOR_2ND, :letter_index => JazzModel::Tone::LetterInterval::SECOND, :strength => 1},
        {:tone => JazzModel::Tone::Interval::MINOR_6TH, :letter_index => JazzModel::Tone::LetterInterval::SIXTH, :strength => 3}
      ])

      c.chord_scales << JazzModel::ChordScale.specify(JazzModel::Scale['Major'][3])
    end

    q.chords.create!(:name => 'Minor b6').tap do |c|
      c.symbols.create!(:name => 'minb6', :primary => true)
      c.symbols.create!(:name => 'mb6')
      c.symbols.create!(:name => 'minorb6')
      c.symbols.create!(:name => 'aeolian')

      c.tones.create([
        {:tone => JazzModel::Tone::Interval::ROOT, :letter_index => JazzModel::Tone::LetterInterval::FIRST, :strength => 0, :omitable => true},
        {:tone => JazzModel::Tone::Interval::MINOR_3RD, :letter_index => JazzModel::Tone::LetterInterval::THIRD, :strength => 1},
        {:tone => JazzModel::Tone::Interval::PERFECT_5TH, :letter_index => JazzModel::Tone::LetterInterval::FIFTH, :strength => 2},
        {:tone => JazzModel::Tone::Interval::MINOR_6TH, :letter_index => JazzModel::Tone::LetterInterval::SIXTH, :strength => 3}
      ])

      c.chord_scales << JazzModel::ChordScale.specify(JazzModel::Scale['Major'][6])
    end

    q.chords.create!(:name => 'Major-Minor').tap do |c|
      c.symbols.create!(:name => 'min#7', :primary => true)
      c.symbols.create!(:name => 'majmin')
      c.symbols.create!(:name => 'm#7', :case_sensitive => true)
      c.symbols.create!(:name => 'minor#7')
      c.symbols.create!(:name => 'major-minor')

      c.tones.create([
        {:tone => JazzModel::Tone::Interval::ROOT, :letter_index => JazzModel::Tone::LetterInterval::FIRST, :strength => 0, :omitable => true},
        {:tone => JazzModel::Tone::Interval::MINOR_3RD, :letter_index => JazzModel::Tone::LetterInterval::THIRD, :strength => 1},
        {:tone => JazzModel::Tone::Interval::PERFECT_5TH, :letter_index => JazzModel::Tone::LetterInterval::FIFTH, :strength => 2},
        {:tone => JazzModel::Tone::Interval::MAJOR_7TH, :letter_index => JazzModel::Tone::LetterInterval::SEVENTH, :strength => 1}
      ])

      c.chord_scales << JazzModel::ChordScale.specify(JazzModel::Scale['Melodic Minor'][1])
    end
  end


  JazzModel::ChordQuality.create!(:name => 'Dominant', :code => 'DOM').tap do |q|
    q.chords.create!(:name => 'Dominant 7').tap do |c|
      c.symbols.create!(:name => '7', :primary => true)
      c.symbols.create!(:name => 'dom')

      c.tones.create([
        {:tone => JazzModel::Tone::Interval::ROOT, :letter_index => JazzModel::Tone::LetterInterval::FIRST, :strength => 0, :omitable => true},
        {:tone => JazzModel::Tone::Interval::MAJOR_3RD, :letter_index => JazzModel::Tone::LetterInterval::THIRD, :strength => 1},
        {:tone => JazzModel::Tone::Interval::PERFECT_5TH, :letter_index => JazzModel::Tone::LetterInterval::FIFTH, :strength => 3, :omitable => true},
        {:tone => JazzModel::Tone::Interval::DOMINANT_7TH, :letter_index => JazzModel::Tone::LetterInterval::SEVENTH, :strength => 2}
      ])

      c.chord_scales << JazzModel::ChordScale.specify(JazzModel::Scale['Major']['Mixolydian'])

      c.children.create!(:name => 'Dominant 9').tap do |cc|
        cc.symbols.create!(:name => '9', :primary => true)
        cc.symbols.create!(:name => 'dom9')

        cc.tones.create([
          {:tone => JazzModel::Tone::Interval::ROOT, :letter_index => JazzModel::Tone::LetterInterval::FIRST, :strength => 0, :omitable => true},
          {:tone => JazzModel::Tone::Interval::MAJOR_3RD, :letter_index => JazzModel::Tone::LetterInterval::THIRD, :strength => 1},
          {:tone => JazzModel::Tone::Interval::PERFECT_5TH, :letter_index => JazzModel::Tone::LetterInterval::FIFTH, :strength => 3, :omitable => true},
          {:tone => JazzModel::Tone::Interval::DOMINANT_7TH, :letter_index => JazzModel::Tone::LetterInterval::SEVENTH, :strength => 2},
          {:tone => JazzModel::Tone::Interval::MAJOR_2ND, :letter_index => JazzModel::Tone::LetterInterval::SECOND, :strength => 4}
        ])

        cc.chord_scales << JazzModel::ChordScale.specify(JazzModel::Scale['Major']['Mixolydian'])
      end

      c.children.create!(:name => 'Dominant 6/9').tap do |cc|
        cc.symbols.create!(:name => '6/9', :primary => true)
        cc.symbols.create!(:name => '69')

        cc.tones.create([
          {:tone => JazzModel::Tone::Interval::ROOT, :letter_index => JazzModel::Tone::LetterInterval::FIRST, :strength => 0, :omitable => true},
          {:tone => JazzModel::Tone::Interval::MAJOR_3RD, :letter_index => JazzModel::Tone::LetterInterval::THIRD, :strength => 1},
          {:tone => JazzModel::Tone::Interval::PERFECT_5TH, :letter_index => JazzModel::Tone::LetterInterval::FIFTH, :strength => 3, :omitable => true},
          {:tone => JazzModel::Tone::Interval::DOMINANT_7TH, :letter_index => JazzModel::Tone::LetterInterval::SEVENTH, :strength => 2},
          {:tone => JazzModel::Tone::Interval::MAJOR_2ND, :letter_index => JazzModel::Tone::LetterInterval::SECOND, :strength => 4},
          {:tone => JazzModel::Tone::Interval::MAJOR_6TH, :letter_index => JazzModel::Tone::LetterInterval::SIXTH, :strength => 4}
        ])

        cc.chord_scales << JazzModel::ChordScale.specify(JazzModel::Scale['Major']['Mixolydian'])
        cc.chord_scales << JazzModel::ChordScale.specify(JazzModel::Scale['Major']['Ionian'])
      end

      c.children.create!(:name => 'Dominant b9').tap do |cc|
        cc.symbols.create!(:name => '7b9', :primary => true)

        cc.tones.create([
          {:tone => JazzModel::Tone::Interval::ROOT, :letter_index => JazzModel::Tone::LetterInterval::FIRST, :strength => 0, :omitable => true},
          {:tone => JazzModel::Tone::Interval::MAJOR_3RD, :letter_index => JazzModel::Tone::LetterInterval::THIRD, :strength => 1},
          {:tone => JazzModel::Tone::Interval::PERFECT_5TH, :letter_index => JazzModel::Tone::LetterInterval::FIFTH, :strength => 3, :omitable => true},
          {:tone => JazzModel::Tone::Interval::DOMINANT_7TH, :letter_index => JazzModel::Tone::LetterInterval::SEVENTH, :strength => 2},
          {:tone => JazzModel::Tone::Interval::MINOR_2ND, :letter_index => JazzModel::Tone::LetterInterval::SECOND, :strength => 4}
        ])

        cc.chord_scales << JazzModel::ChordScale.specify(JazzModel::Scale['Diminished'][1])
        cc.chord_scales << JazzModel::ChordScale.specify(JazzModel::Scale['Major']['Mixolydian'], 2)
      end

      c.children.create!(:name => 'Dominant #9').tap do |cc|
        cc.symbols.create!(:name => '7#9', :primary => true)

        cc.tones.create([
          {:tone => JazzModel::Tone::Interval::ROOT, :letter_index => JazzModel::Tone::LetterInterval::FIRST, :strength => 0, :omitable => true},
          {:tone => JazzModel::Tone::Interval::MAJOR_3RD, :letter_index => JazzModel::Tone::LetterInterval::THIRD, :strength => 1},
          {:tone => JazzModel::Tone::Interval::PERFECT_5TH, :letter_index => JazzModel::Tone::LetterInterval::FIFTH, :strength => 3, :omitable => true},
          {:tone => JazzModel::Tone::Interval::DOMINANT_7TH, :letter_index => JazzModel::Tone::LetterInterval::SEVENTH, :strength => 2},
          {:tone => JazzModel::Tone::Interval::AUGMENTED_2ND, :letter_index => JazzModel::Tone::LetterInterval::SECOND, :strength => 4}
        ])

        cc.chord_scales << JazzModel::ChordScale.specify(JazzModel::Scale['Melodic Minor'][7])
        cc.chord_scales << JazzModel::ChordScale.specify(JazzModel::Scale['Diminished'][1], 2)
      end

      c.children.create!(:name => 'Dominant #11').tap do |cc|
        cc.symbols.create!(:name => '7#11', :primary => true)
        cc.symbols.create!(:name => 'lyd7')
        cc.symbols.create!(:name => 'lydiandom')

        cc.tones.create([
          {:tone => JazzModel::Tone::Interval::ROOT, :letter_index => JazzModel::Tone::LetterInterval::FIRST, :strength => 0, :omitable => true},
          {:tone => JazzModel::Tone::Interval::MAJOR_3RD, :letter_index => JazzModel::Tone::LetterInterval::THIRD, :strength => 1},
          {:tone => JazzModel::Tone::Interval::PERFECT_5TH, :letter_index => JazzModel::Tone::LetterInterval::FIFTH, :strength => 3, :omitable => true},
          {:tone => JazzModel::Tone::Interval::DOMINANT_7TH, :letter_index => JazzModel::Tone::LetterInterval::SEVENTH, :strength => 2},
          {:tone => JazzModel::Tone::Interval::AUGMENTED_4TH, :letter_index => JazzModel::Tone::LetterInterval::FOURTH, :strength => 4}
        ])

        cc.chord_scales << JazzModel::ChordScale.specify(JazzModel::Scale['Melodic Minor'][4])
      end

      c.children.create!(:name => 'Mixoylidian b6').tap do |cc|
        cc.symbols.create!(:name => '7b6', :primary => true)

        cc.tones.create([
          {:tone => JazzModel::Tone::Interval::ROOT, :letter_index => JazzModel::Tone::LetterInterval::FIRST, :strength => 0, :omitable => true},
          {:tone => JazzModel::Tone::Interval::MAJOR_3RD, :letter_index => JazzModel::Tone::LetterInterval::THIRD, :strength => 1},
          {:tone => JazzModel::Tone::Interval::PERFECT_5TH, :letter_index => JazzModel::Tone::LetterInterval::FIFTH, :strength => 3},
          {:tone => JazzModel::Tone::Interval::DOMINANT_7TH, :letter_index => JazzModel::Tone::LetterInterval::SEVENTH, :strength => 2},
          {:tone => JazzModel::Tone::Interval::MINOR_6TH, :letter_index => JazzModel::Tone::LetterInterval::SIXTH, :strength => 4}
        ])

        cc.chord_scales << JazzModel::ChordScale.specify(JazzModel::Scale['Melodic Minor'][5])
      end

      c.children.create!(:name => 'Altered').tap do |cc|
        cc.symbols.create!(:name => 'alt', :primary => true)
        cc.symbols.create!(:name => 'altered')
        cc.symbols.create!(:name => '7#9#5')
        cc.symbols.create!(:name => '7#5#9')
        cc.symbols.create!(:name => '7b9#9')
        cc.symbols.create!(:name => '7#9b9')
        cc.symbols.create!(:name => '7#5')

        cc.tones.create([
          {:tone => JazzModel::Tone::Interval::ROOT, :letter_index => JazzModel::Tone::LetterInterval::FIRST, :strength => 0, :omitable => true},
          {:tone => JazzModel::Tone::Interval::MAJOR_3RD, :letter_index => JazzModel::Tone::LetterInterval::THIRD, :strength => 1},
          {:tone => JazzModel::Tone::Interval::DOMINANT_7TH, :letter_index => JazzModel::Tone::LetterInterval::SEVENTH, :strength => 2},
          {:tone => JazzModel::Tone::Interval::MINOR_2ND, :letter_index => JazzModel::Tone::LetterInterval::SECOND, :strength => 4},
          {:tone => JazzModel::Tone::Interval::AUGMENTED_2ND, :letter_index => JazzModel::Tone::LetterInterval::SECOND, :strength => 4},
          {:tone => JazzModel::Tone::Interval::AUGMENTED_5TH, :letter_index => JazzModel::Tone::LetterInterval::FIFTH, :strength => 4}
        ])

        cc.chord_scales << JazzModel::ChordScale.specify(JazzModel::Scale['Melodic Minor'][7])
      end

      c.children.create!(:name => 'Dominant b5').tap do |cc|
        cc.symbols.create!(:name => '7b5', :primary => true)

        cc.tones.create([
          {:tone => JazzModel::Tone::Interval::ROOT, :letter_index => JazzModel::Tone::LetterInterval::FIRST, :strength => 0, :omitable => true},
          {:tone => JazzModel::Tone::Interval::MAJOR_3RD, :letter_index => JazzModel::Tone::LetterInterval::THIRD, :strength => 1},
          {:tone => JazzModel::Tone::Interval::DIMINISHED_5TH, :letter_index => JazzModel::Tone::LetterInterval::FIFTH, :strength => 3},
          {:tone => JazzModel::Tone::Interval::DOMINANT_7TH, :letter_index => JazzModel::Tone::LetterInterval::SEVENTH, :strength => 2}
        ])

        cc.chord_scales << JazzModel::ChordScale.specify(JazzModel::Scale['Melodic Minor'][4])
      end

    end
  end


  JazzModel::ChordQuality.create!(:name => 'Diminished', :code => 'DIM').tap do |q|
    q.chords.create!(:name => 'Diminished Triad').tap do |c|
      c.symbols.create!(:name => 'dim', :primary => true)
      c.symbols.create!(:name => 'b5')

      c.tones.create([
        {:tone => JazzModel::Tone::Interval::ROOT, :letter_index => JazzModel::Tone::LetterInterval::FIRST, :strength => 0},
        {:tone => JazzModel::Tone::Interval::MINOR_3RD, :letter_index => JazzModel::Tone::LetterInterval::THIRD, :strength => 1},
        {:tone => JazzModel::Tone::Interval::DIMINISHED_5TH, :letter_index => JazzModel::Tone::LetterInterval::FIFTH, :strength => 1}
      ])

      c.chord_scales << JazzModel::ChordScale.specify(JazzModel::Scale['Diminished'][1])
      c.chord_scales << JazzModel::ChordScale.specify(JazzModel::Scale['Diminished'][2])
    end

    q.chords.create!(:name => 'Half Diminished').tap do |c|
      c.symbols.create!(:name => 'dim7', :primary => true)
      c.symbols.create!(:name => '7b5')

      c.tones.create([
        {:tone => JazzModel::Tone::Interval::ROOT, :letter_index => JazzModel::Tone::LetterInterval::FIRST, :strength => 0},
        {:tone => JazzModel::Tone::Interval::MINOR_3RD, :letter_index => JazzModel::Tone::LetterInterval::THIRD, :strength => 2},
        {:tone => JazzModel::Tone::Interval::DIMINISHED_5TH, :letter_index => JazzModel::Tone::LetterInterval::FIFTH, :strength => 1},
        {:tone => JazzModel::Tone::Interval::MINOR_7TH, :letter_index => JazzModel::Tone::LetterInterval::SEVENTH, :strength => 1}
      ])

      c.chord_scales << JazzModel::ChordScale.specify(JazzModel::Scale['Major'][7])
      c.chord_scales << JazzModel::ChordScale.specify(JazzModel::Scale['Melodic Minor'][6])
    end

    q.chords.create!(:name => 'Full Diminished').tap do |c|
      c.symbols.create!(:name => 'fulldim', :primary => true)
      c.symbols.create!(:name => 'b5bb7')

      c.tones.create([
        {:tone => JazzModel::Tone::Interval::ROOT, :letter_index => JazzModel::Tone::LetterInterval::FIRST, :strength => 0},
        {:tone => JazzModel::Tone::Interval::MINOR_3RD, :letter_index => JazzModel::Tone::LetterInterval::THIRD, :strength => 2},
        {:tone => JazzModel::Tone::Interval::DIMINISHED_5TH, :letter_index => JazzModel::Tone::LetterInterval::FIFTH, :strength => 1},
        {:tone => JazzModel::Tone::Interval::DIMINISHED_7TH, :letter_index => JazzModel::Tone::LetterInterval::SEVENTH, :strength => 1}
      ])

      c.chord_scales << JazzModel::ChordScale.specify(JazzModel::Scale['Diminished'][1])
      c.chord_scales << JazzModel::ChordScale.specify(JazzModel::Scale['Diminished'][2])
    end
  end
end