JazzModel::Base.connection.tap do |c|
  c.create_table :keys do |t|
    t.string :name
    t.string :long_name
    t.boolean :primary, :default => true
    t.integer :index
    t.integer :letter_index
    t.integer :cycle_index
  end
  
  c.create_table :chord_qualities do |t|
    t.string :name
    t.string :code
  end
  
  c.create_table :chords do |t|
    t.belongs_to :chord_quality
    t.integer :parent_id
    t.string :name
    t.text :synonyms
    t.text :information
  end
  
  c.create_table :chord_symbols do |t|
    t.belongs_to :chord
    t.string :name
    t.boolean :case_sensitive, :default => false
    t.integer :strength
    t.boolean :primary, :default => false
  end
  
  c.create_table :chord_tones do |t|
    t.belongs_to :chord
    t.integer :position
    t.integer :tone
    t.integer :letter_index
    t.integer :strength
    t.boolean :omitable, :default => false
    t.text :information
  end
  
  c.create_table :scales do |t|
    t.string :name
    t.string :information
    t.integer :symmetry_index
  end
  
  c.create_table :scale_tones do |t|
    t.belongs_to :scale
    t.integer :position
    t.integer :tone
    t.integer :letter_index
  end
  
  c.create_table :modes do |t|
    t.belongs_to :scale
    t.integer :mode
    t.string :name
    t.text :synonyms
    t.integer :dissonance
  end
  
  c.create_table :chord_scales do |t|
    t.belongs_to :chord
    t.belongs_to :mode
    t.integer :strength
    t.text :information
  end
  
  c.create_table :voicings do |t|
    t.belongs_to :chord
    t.string :name
    t.text :information
  end
  
  c.create_table :voicing_tones do |t|
    t.belongs_to :voicings
    t.integer :position
    t.integer :tone
    t.integer :tone_reference_offset, :default => 0
    t.text :information
  end
end
