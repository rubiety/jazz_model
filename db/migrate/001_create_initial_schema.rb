class CreateInitialSchema < ActiveRecord::Migration
  def self.up
		create_table :keys	do |t|
			t.string :name
			t.string :long_name
			t.boolean :primary, :default => true
			t.integer :index
			t.integer :letter_index
			t.integer :cycle_index
		end
		
		create_table :chord_qualities do |t|
			t.string :name
			t.string :code
		end
		
    create_table :chords do |t|
			t.belongs_to :chord_quality
			t.integer :parent_id
			t.string :name
			t.text :synonyms
			t.text :information
    end
		
		create_table :chord_symbols do |t|
			t.belongs_to :chord
			t.string :name
			t.boolean :case_sensitive, :default => false
			t.integer :strength
			t.boolean :primary, :default => false
		end
		
		create_table :chord_tones do |t|
			t.belongs_to :chord
			t.integer :position
			t.integer :tone
			t.integer :letter_index
			t.integer :strength
			t.boolean :omitable, :default => false
			t.text :information
		end
		
		create_table :scales do |t|
			t.string :name
			t.string :information
			t.integer :symmetry_index
		end
		
		create_table :scale_tones do |t|
			t.belongs_to :scale
			t.integer :position
			t.integer :tone
			t.integer :letter_index
		end
		
		create_table :modes do |t|
			t.belongs_to :scale
			t.integer :mode
			t.string :name
			t.text :synonyms
			t.integer :dissonance
		end
		
		create_table :chord_scales do |t|
			t.belongs_to :chord
			t.belongs_to :mode
			t.integer :strength
			t.text :information
		end
		
		create_table :voicings do |t|
			t.belongs_to :chord
			t.string :name
			t.text :information
		end
		
		create_table :voicing_tones do |t|
			t.belongs_to :voicings
			t.integer :position
			t.integer :tone
			t.integer :tone_reference_offset, :default => 0
			t.text :information
		end
  end
	
  def self.down
		drop_table :chord_qualities
    drop_table :chords
		drop_table :chord_symbols
		drop_table :chord_tones
		drop_table :scales
		drop_table :scale_tones
		drop_table :modes
		drop_table :chord_scales
		drop_table :voicings
  end
end
